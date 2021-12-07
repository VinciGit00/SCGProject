import 'package:http/http.dart' as http;
import 'package:csv/csv.dart';

//  QUESTA FUNZIONE RECUPERA I DATASETS DAL FILESYSTEM E LI CONVERTE IN LISTE

class FetchDatasets {
  Future<List<Data>> fetchDatasets(
      {required String nomeDataset,
      required int xIndex,
      required int yIndex}) async {
    // Invio la richiesta di GET
    final response = await http.get(
        Uri.parse("http://127.0.0.1:5000/get-csvgraph/$nomeDataset" ".csv"),
        headers: {
          "Content-type": "multipart/form-data",
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Methods": "GET, OPTIONS"
        });

    String file = response.body;

    // Converto il dataset in una lista di liste
    List<List<dynamic>> file1 = const CsvToListConverter().convert(file);

    // Seleziono solamente le due liste che voglio usare come valori su asse x e su asse y
    // NB: Se xIndex == 100 allora sulle x mostro un valore crescente per ogni dato
    List<Data> list = file1
        .skip(1)
        .map(
          (e) => Data(
              xValues: xIndex == 100 ? file1.indexOf(e).toString() : e[xIndex],
              yValues: e[yIndex]),
        )
        .toList();

    return list;
  }
}

//
class Data {
  Data({required this.xValues, required this.yValues});
  final String xValues;
  final double yValues;
}
