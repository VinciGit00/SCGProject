import 'package:frontendscg/utils/graph_names.dart';
import 'package:frontendscg/utils/modello_grafico.dart';
import 'package:frontendscg/widgets/column_chart.dart';
import 'package:frontendscg/widgets/pie_chart.dart';

// DATABASE MOCKUP, DA QUI VENGONO PRESE LE LISTE DI GRAFICI PER NON INTASARE IL CODICE

class Database {
  Database() {
    scostamentoTotaleMol = 1500010;
    scostamentoCostiTotali = 250021;
    scostamentoRicavi = 200239;
    scostamentoMateriePrime = 10002;
    scostamentoLavorazioniInterne = 1000000;
    budgetMol = 500010;
    consuntivoMol = 210000;
  }

  // LISTA DATI PER GRAFICO COLONNE BUDGET/CONSUNTIVO NELLA HOMEPAGE
  // TODO: sostituire "colonna1", "colonna2" con il valore preso dall'api
  Future<List<ColumnChartData>> budgetConsuntivoMolData =
      Future.delayed(Duration(seconds: 2)).then((value) => [
            ColumnChartData(x: 'Ricavi', colonna1: 12, colonna2: 20),
            ColumnChartData(x: 'Materie Prime', colonna1: 15, colonna2: 50),
            ColumnChartData(
                x: 'Lavorazioni Interne', colonna1: 30, colonna2: 20),
            ColumnChartData(x: 'Costi Totali', colonna1: 6.4, colonna2: 38),
            ColumnChartData(x: 'Margine Op. Lordo', colonna1: 14, colonna2: 36)
          ]);

  // LISTA DATI PER GRAFICO SCOSTAMENTO NELLA HOMEPAGE
  // TODO: sostituire "colonna1"con il valore preso dall'api
  Future<List<ColumnChartData>> scostamentoMolData =
      Future.delayed(Duration(seconds: 2)).then((value) => [
            ColumnChartData(x: 'Ricavi', colonna1: 12),
            ColumnChartData(x: 'Materie Prime', colonna1: 15),
            ColumnChartData(x: 'Lavorazioni Interne', colonna1: 30),
            ColumnChartData(x: 'Costi Totali', colonna1: 6.4),
            ColumnChartData(x: 'Margine Op. Lordo', colonna1: 14)
          ]);

  // LISTA DATI PER GRAFICO A TORTA DEGLI SCOSTAMENTI NELLA HOMEPAGE
  // TODO: sostituire "valoreScostamento" con il valore preso dall'api
  Future<List<PieChartData>> listaHomePieChart =
      Future.delayed(Duration(seconds: 2)).then((value) => [
            PieChartData('Ricavi', 20),
            PieChartData('Materie Prime', 50),
            PieChartData('Lavorazioni Interne', 20),
            PieChartData('Costi Totali', 38),
          ]);

  // SCOSTAMENTO RICAVI
  late double scostamentoRicavi;

  // SCOSTAMENTO MATERIE PRIME
  late double scostamentoMateriePrime;

  // SCOSTAMENTO LAVORAZIONI INTERNE
  late double scostamentoLavorazioniInterne;

  // SCOSTAMENTO COSTI TOTALI
  late double scostamentoCostiTotali;

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
