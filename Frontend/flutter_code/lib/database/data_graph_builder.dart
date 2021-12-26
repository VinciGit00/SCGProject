import 'package:frontendscg/functions/fetch_data.dart';
import 'package:frontendscg/widgets/column_chart.dart';
import 'package:frontendscg/widgets/pie_chart.dart';
import '../functions/fetch_data.dart';

class DataGraphBuilder {
  // LISTA DATI PER GRAFICO SCOSTAMENTO MOL NELLA HOMEPAGE
  Future<List<ColumnChartData>> datiGraficoHomepageScostamento() async {
    dynamic data = await FetchData().getData();
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

  // LISTA DATI PER GRAFICO BUDGET/CONSUNTIVO MOL NELLA HOMEPAGE
  Future<List<ColumnChartData>> datiGraficoHomepageBudgetConsuntivo() async {
    dynamic data = await FetchData().getData();
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
      ColumnChartData(
          x: 'Margine Op. Lordo',
          colonna1: data["molBudget"],
          colonna2: data["molConsuntivo"])
    ];
  }

  // LISTA DATI PER GRAFICO A TORTA DEGLI SCOSTAMENTI NELLA HOMEPAGE
  Future<List<PieChartData>> datiPieChartHomepage() async {
    dynamic data = await FetchData().getData();
    return [
      PieChartData('Ricavi', data["ricaviScostamento"]),
      PieChartData('Materie Prime', data["materiePrimeScostamento"]),
      PieChartData(
          'Lavorazioni Interne', data["lavorazioniInterneScostamento"]),
      PieChartData('Costi Totali', data["costiScostamento"]),
    ];
  }

/* 
  Future<List<ColumnChartData>> datiGraficoHomepageScostamento() async {
    dynamic data = await FetchData().getData();
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

 */

  Future<List<ColumnChartData>> budgetConsuntivoMolData =
      Future.delayed(Duration(seconds: 2)).then((value) => [
            ColumnChartData(x: 'Ricavi', colonna1: 12, colonna2: 20),
            ColumnChartData(x: 'Materie Prime', colonna1: 15, colonna2: 50),
            ColumnChartData(
                x: 'Lavorazioni Interne', colonna1: 30, colonna2: 20),
            ColumnChartData(x: 'Costi Totali', colonna1: 6.4, colonna2: 38),
            ColumnChartData(x: 'Margine Op. Lordo', colonna1: 14, colonna2: 36)
          ]);

  ///
  ///////////////////
  // RICAVI
  ///////////////////
  ///

  /// Grafico Scostamento Ricavi
  Future<List<ColumnChartData>> ricaviScostamentoData() async {
    dynamic data = await FetchData().getData();
    return [
      ColumnChartData(x: 'Ricavi', colonna1: data["ricaviScostamento"]),
      ColumnChartData(x: 'Volume', colonna1: data["ricaviScostamentoVolume"]),
      ColumnChartData(x: 'Mix', colonna1: data["ricaviScostamentoMix"]),
      ColumnChartData(
          x: 'Tasso Cambio', colonna1: data["ricaviScostamentoTassoCambio"]),
    ];
  }

  /// Grafico Budget/Consuntivo Ricavi
  Future<List<ColumnChartData>> ricaviBudgetConsuntivoData() async {
    dynamic data = await FetchData().getData();
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
}
