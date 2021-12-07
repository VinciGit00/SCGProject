import 'package:http/http.dart' as http;
import 'package:csv/csv.dart';

class Test {
  Future<List<Data>> getlist() async {
    final response = await http.get(
        Uri.parse("http://127.0.0.1:5000/get-csvgraph/dfVendite.csv"),
        headers: {
          "Content-type": "multipart/form-data",
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Methods": "GET, OPTIONS"
        });

    String file = response.body;

    List<List<dynamic>> file1 = const CsvToListConverter().convert(file);

    List<Data> list = file1
        .skip(1)
        .map(
          (e) => Data(time: file1.indexOf(e).toString(), value: e[6]),
        )
        .toList();

    return list;
  }
}

class Data {
  Data({required this.time, required this.value});
  final String time;
  final double value;
}
