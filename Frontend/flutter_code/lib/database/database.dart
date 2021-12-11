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
  List<ColumnChartData> listaHomeColumnChart = [
    ColumnChartData('Ricavi', 12, 20),
    ColumnChartData('Materie Prime', 15, 50),
    ColumnChartData('Lavorazioni Interne', 30, 20),
    ColumnChartData('Costi Totali', 6.4, 38),
    ColumnChartData('Margine Op. Lordo', 14, 36)
  ];

  // LISTA DATI PER GRAFICO A TORTA DEGLI SCOSTAMENTI NELLA HOMEPAGE
  List<PieChartData> listaHomePieChart = [
    PieChartData('Ricavi', 20),
    PieChartData('Materie Prime', 50),
    PieChartData('Lavorazioni Interne', 20),
    PieChartData('Costi Totali', 38),
  ];


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
