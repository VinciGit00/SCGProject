import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class UploadDataset {
  // CARICAMENTO DATASET ED INVIO A SERVER
  Future<bool> upload() async {
    // Prendo il file
    var picked = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv', 'xlsx'],
      withData: true,
    );

    if (picked != null) {
      print(picked.files.first.name);

      final fileBytes = picked.files.first.bytes;
      final List<int> selected_file = List.from(fileBytes!.map((e) => (e)));

      var url = Uri.parse("http://127.0.0.1:5000/uploadDataset");
      var request = http.MultipartRequest("POST", url);

      request.files.add(
        http.MultipartFile.fromBytes('file', selected_file,
            contentType: MediaType('file', 'csv'),
            filename: picked.names.first),
      );

      // Aggiungo gli headers
      request.headers.addAll({"Content-type": "multipart/form-data"});

      // Controllo se la richiesta http va a buon fine e concludo la funzione
      request.send().then(
        (response) {
          if (response.statusCode == 200) {
            return true;
          } else {
            return false;
          }
        },
      );

      return false;
    }

    // Se l'utente non seleziona nessun file da caricare ritorno false
    else {
      return false;
    }
  }
}
