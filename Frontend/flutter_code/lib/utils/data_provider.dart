import 'package:flutter/cupertino.dart';
import 'package:frontendscg/functions/fetch_data.dart';

// Provider for sharing data for every graph and label
// This allow to compute the script only once and then share the result among the widget tree

class DataProvider with ChangeNotifier {
  // Variabile che contiene il risultato dello script
  late Map<String, dynamic> data;

  // Funzione che esegue lo script, aggiorna la variabile data e avvisa i listeners
  Future<Map<String, dynamic>> init() async {
    data = await FetchData().getData();
    notifyListeners();
    return data;
  }
}
