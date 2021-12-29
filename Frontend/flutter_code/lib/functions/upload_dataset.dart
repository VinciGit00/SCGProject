import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

// FUNZIONE PER IL CARICAMENTO DEL DATASET E DELLO STORAGE NEL FILE SYSTEM

class UploadDataset {
  Future<bool> upload() async {
    // Prendo il file
    // NB: FilePickerResult può essere insieme di più file
    FilePickerResult? picked = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['csv', 'xlsx'],
      withData: true,
    );

    // Controllo se l'utente ha selezionato un file
    if (picked != null) {
      // Ciascuno degli Uint8List rappresenta i bytes di un singolo dataset
      final List<Uint8List?> fileBytes =
          picked.files.map((e) => e.bytes).toList();
      // Creo una lista di liste dove ciascuna lista sono i bytes di ciascun dataset
      final List<List<int>> selectedFile = List.from(fileBytes.map((e) => (e)));

      // Chiamo l'api per l'invio
      var url = Uri.parse("http://127.0.0.1:5000/uploadDataset");
      var request = http.MultipartRequest("POST", url);

      // Aggiungo alla lista dei file selezionati per l'invio quelli che ho caricato
      selectedFile.asMap().forEach(
            (index, e) => request.files.add(
              http.MultipartFile.fromBytes(
                'file',
                e,
                contentType: MediaType('file', 'csv'),
                // filename = nome del file caricato
                filename: picked.names[index],
              ),
            ),
          );

      // Aggiungo gli headers
      request.headers.addAll({"Content-type": "multipart/form-data"});

      // Controllo se la richiesta http va a buon fine formatto i nuovi dataset e concludo la funzione
      return request.send().then(
        (response) async {
          if (response.statusCode == 200) {
            // Chiamo funzione per la formattazione dei dataset
            await http.get(Uri.parse("http://127.0.0.1:5000/format-datasets"),
                headers: {
                  "Content-type": "multipart/form-data",
                  "Access-Control-Allow-Origin": "*",
                  "Access-Control-Allow-Methods": "GET, OPTIONS"
                });
            return true;
          } else {
            return false;
          }
        },
      );
    }

    // Se l'utente non seleziona nessun file da caricare ritorno false
    else {
      return false;
    }
  }
}
