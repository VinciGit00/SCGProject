import 'dart:convert';
import 'package:http/http.dart' as http;

// Recupero i dati restituiti in output dallo script python

class FetchData {
  Future<Map<String, dynamic>> getData() async {
    // Invio la richiesta di GET
    final response = await http
        .get(Uri.parse("http://127.0.0.1:5000/get-scriptdata"), headers: {
      "Content-type": "multipart/form-data",
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "GET, OPTIONS"
    });

    // Converto il json in una mappa
    Map<String, dynamic> data = json.decode(response.body);

    return data;
  }
}
