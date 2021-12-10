import 'package:frontendscg/utils/graph_names.dart';
import 'package:frontendscg/utils/modello_grafico.dart';
import 'package:frontendscg/widgets/columnChart.dart';

// DATABASE MOCKUP, DA QUI VENGONO PRESE LE LISTE DI GRAFICI PER NON INTASARE IL CODICE

class Database {
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
      indexY2: 3
    ),       
  ];

  List<ColumnChartData> listaHomeColumnChart =  [
      ColumnChartData('Ricavi', 12),
      ColumnChartData('Materie Prime', 15),
      ColumnChartData('Lavorazioni Interne', 30),
      ColumnChartData('Costi Totali', 6.4),
      ColumnChartData('Margine Op. Lordo', 14)
    ];
}
