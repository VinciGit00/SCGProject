import 'package:frontendscg/utils/graph_names.dart';
import 'package:frontendscg/utils/modello_grafico.dart';

// DATABASE MOCKUP, DA QUI VENGONO PRESE LE LISTE DI GRAFICI PER NON INTASARE IL CODICE

class Database {
  // Lista grafici raw
  List<ModelloGrafico> rawGraphsList = [
    ModelloGrafico(
      nomeGrafico: GraphNames.VALUTA,
      indexX: 100,
      indexY: 1,
    ),
    ModelloGrafico(
      nomeGrafico: GraphNames.CONSUMI_COSTO_TOTALE,
      indexX: 100,
      indexY: 7,
    ),
    ModelloGrafico(
      nomeGrafico: GraphNames.IMPIEGO_RISORSE_DESCRIZIONE,
      indexX: 100,
      indexY: 7,
    ),
  ];
}
