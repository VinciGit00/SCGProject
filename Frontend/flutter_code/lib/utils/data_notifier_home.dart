import 'package:flutter/cupertino.dart';

class DataNotifierHome with ChangeNotifier {
  DataNotifierHome() {
    isGraficoScostamentoHome = false;
  }

  late bool isGraficoScostamentoHome;

  void showGraficoScostamento() {
    isGraficoScostamentoHome = true;
    notifyListeners();
  }

  void showGraficoBudgetConsuntivo() {
    isGraficoScostamentoHome = false;
    notifyListeners();
  }
}
