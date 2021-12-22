import 'package:flutter/cupertino.dart';

// Provider for state management of PaginaSecondaria

class DataNotifier with ChangeNotifier {
  DataNotifier() {
    isGraficoScostamentoPagSecondaria = false;
  }

  late bool isGraficoScostamentoPagSecondaria;

  void showGraficoScostamento() {
    isGraficoScostamentoPagSecondaria = true;
    notifyListeners();
  }

  void showGraficoBudgetConsuntivo() {
    isGraficoScostamentoPagSecondaria = false;
    notifyListeners();
  }
}
