import 'package:frontendscg/utils/graph_names.dart';
import 'package:frontendscg/utils/modello_grafico.dart';
import 'package:frontendscg/widgets/columnChart.dart';

// DATABASE MOCKUP, DA QUI VENGONO PRESE LE LISTE DI GRAFICI PER NON INTASARE IL CODICE

class Database {
  Database() {
     scostamentoTotaleMol = 1500010;
     budgetMol = 500010;
     consuntivoMol = 210000;
  }

  // LISTA DATI PER GRAFICO COLONNE BUDGET/CONSUNTIVO NELLA HOMEPAGE
  List<ColumnChartData> listaHomeColumnChart = [
    ColumnChartData('Ricavi', 12, 20),
    ColumnChartData('Materie Prime', 15, 50),
    ColumnChartData('Lavorazioni Interne', 30, 20),
    ColumnChartData('Costi Totali', 6.4, 38),
    ColumnChartData('Margine Op. Lordo', 14, 36)
  ];

  // SCOSTAMENTO TOTALE MOL
  late double scostamentoTotaleMol;
  // CONSUNTIVO MOL
  late double budgetMol;
  // BUDGET MOL
  late double consuntivoMol;

  // Lista grafici raw
  List<ModelloGrafico> scostamentiCosti = [
    // VENDITE
    ModelloGrafico(
      nomeGrafico: GraphNames.VENDITE,
      indexX: 100,
      indexY1: 6,
    ),

    // SCOSTAMENTO CONSUMI ARTICOLO
    ModelloGrafico(
        nomeGrafico: GraphNames.SCOSTAMENTO_CONSUMI_ART,
        indexX: 100,
        // Costo mp budget
        indexY1: 2,
        // Costo mp consuntivo
        indexY2: 3),
  ];
}
