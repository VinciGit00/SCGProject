import 'package:http/http.dart' as http;
import 'package:csv/csv.dart';

//  QUESTA FUNZIONE RECUPERA I DATASETS DAL FILESYSTEM E LI CONVERTE IN LISTE

// NB: L'index delle colonne parte a contare da 1 (non si deve contare la colonna con il numero progressivo)

class FetchDatasets {
  Future<List<Data>> fetchDatasets({
    required String nomeDataset,
    required int xIndex,
    required int yIndex1,
    // yIndex2 e yIndex3 sono opzionali, se vengono omessi allora sono = a null e non hanno nessun effetto
    int? yIndex2,
    int? yIndex3,
    // nome del singolo dato che voglio disegnare sul grafico
    String? nomeSingoloDato,
    // numero colonna su cui voglio andare a cercare il dato
    int? indexNomeColonna,
  }) async {
    // Invio la richiesta di GET
    final response = await http.get(
        Uri.parse("http://127.0.0.1:5000/get-csvgraph/$nomeDataset" ".csv"),
        headers: {
          "Content-type": "multipart/form-data",
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Methods": "GET, OPTIONS"
        });

    // Converto il dataset in una lista di liste
    List<List<dynamic>> file =
        const CsvToListConverter().convert(response.body);

    // Tolgo la prima riga con i nomi delle colonne
    file = file.skip(1).toList();

    // Per filtrare in base al nome ed index provveduti. Se nomeSingoloDato or indexNomeColonna == null allora salto questo passaggio.
    // Itero le righe del dataset, controllo che per l'index specificato, quel nome sia uguale a quello che voglio, altrimenti tolgo la riga
    if (nomeSingoloDato != null && indexNomeColonna != null) {
      file.removeWhere(
        (element) => element[indexNomeColonna] != nomeSingoloDato,
      );
    }

    // Seleziono i valori da mettere sulla x e i valori da mettere sulla y
    // Almeno un valore sulla Y è obbligatorio (yIndex1), gli altri due se sono = null non influiscono
    // NB: Se xIndex == 100 allora sulle x mostro un valore crescente per ogni dato
    List<Data> list = file
        .map((e) => Data(
              xValues: xIndex == 100 ? file.indexOf(e).toString() : e[xIndex],
              yValues1: e[yIndex1],
              yValues2: yIndex2 != null ? e[yIndex2] : null,
              yValues3: yIndex3 != null ? e[yIndex3] : null,
            ))
        .toList();

    return list;
  }

// Questa funzione ritorna la lista dei nomi delle colonne
  Future<List<dynamic>> getDatasetColumnNames(String nomeDataset) async {
    final response = await http.get(
        Uri.parse("http://127.0.0.1:5000/get-csvgraph/$nomeDataset" ".csv"),
        headers: {
          "Content-type": "multipart/form-data",
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Methods": "GET, OPTIONS"
        });

    List<List<dynamic>> file =
        const CsvToListConverter().convert(response.body);
    // Ritorno solo la prima riga contenten i nomi
    return file.first;
  }
}

// La prima linea sulle y è obbligatoria, le altre due sono opzionali
class Data {
  Data({
    required this.xValues,
    required this.yValues1,
    this.yValues2,
    this.yValues3,
  });
  final String xValues;
  final double yValues1;
  final double? yValues2;
  final double? yValues3;
}
