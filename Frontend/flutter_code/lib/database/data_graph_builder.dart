import 'package:frontendscg/widgets/column_chart.dart';
import 'package:frontendscg/widgets/pie_chart.dart';

class DataGraphBuilder {
  ///
  ///////////////////
  // RICAVI
  ///////////////////
  ///

  /// Grafico Scostamento Ricavi
  List<ColumnChartData> ricaviScostamentoData(dynamic data) {
    return [
      ColumnChartData(x: 'Ricavi', colonna1: data["ricaviScostamento"]),
      ColumnChartData(x: 'Volume', colonna1: data["ricaviScostamentoVolume"]),
      ColumnChartData(x: 'Mix', colonna1: data["ricaviScostamentoMix"]),
      ColumnChartData(
          x: 'Tasso Cambio', colonna1: data["ricaviScostamentoTassoCambio"]),
    ];
  }

  /// Grafico Budget/Consuntivo Ricavi
  List<ColumnChartData> ricaviBudgetConsuntivoData(dynamic data) {
    return [
      ColumnChartData(x: 'Budget', colonna1: data["ricaviBudget"]),
      ColumnChartData(x: 'Mix Consuntivo', colonna1: data["ricaviMixStandard"]),
      ColumnChartData(x: 'Tasso Cambio', colonna1: data["ricaviMixConsuntivo"]),
      ColumnChartData(
          x: 'Volume Consuntivo',
          colonna1: data["ricaviTassoCambioConsuntivo"]),
      ColumnChartData(x: 'Consuntivo', colonna1: data["ricaviConsuntivo"])
    ];
  }

  ///
///////////////////
// MARGINE OPERATIVO LORDO
///////////////////
  ///

// Dati per il piechart relativo al MOL presente nella homepage
  List<PieChartData> molPieChartData(dynamic data) {
    return [
      PieChartData('Ricavi', data["ricaviScostamento"]),
      PieChartData('Materie Prime', data["materiePrimeScostamento"]),
      PieChartData(
          'Lavorazioni Interne', data["lavorazioniInterneScostamento"]),
      PieChartData('Costi Totali', data["costiScostamento"]),
    ];
  }

// Column Chart scostamento MOL
  List<ColumnChartData> molBudgetConsuntivoData(dynamic data) {
    return [
      ColumnChartData(
          x: 'Ricavi',
          colonna1: data["ricaviBudget"],
          colonna2: data["ricaviConsuntivo"]),
      ColumnChartData(
          x: 'Materie Prime',
          colonna1: data["materiePrimeBudget"],
          colonna2: data["materiePrimeConsuntivo"]),
      ColumnChartData(
          x: 'Lavorazioni Interne',
          colonna1: data["lavorazioniInterneBudget"],
          colonna2: data["lavorazioniInterneConsuntivo"]),
      ColumnChartData(
          x: 'Costi Totali',
          colonna1: data["costiBudget"],
          colonna2: data["costiConsuntivo"]),
    ];
  }

  // Column Chart Scostamento MOL
  List<ColumnChartData> molScostamentoData(dynamic data) {
    return [
      ColumnChartData(x: 'Ricavi', colonna1: data["ricaviScostamento"]),
      ColumnChartData(
          x: 'Materie Prime', colonna1: data["materiePrimeScostamento"]),
      ColumnChartData(
          x: 'Lavorazioni Interne',
          colonna1: data["lavorazioniInterneScostamento"]),
      ColumnChartData(x: 'Costi Totali', colonna1: data["costiScostamento"]),
      ColumnChartData(x: 'Margine Op. Lordo', colonna1: data["molScostamento"])
    ];
  }
}
