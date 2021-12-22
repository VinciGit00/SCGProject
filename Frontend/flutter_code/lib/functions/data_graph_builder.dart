import 'package:frontendscg/widgets/column_chart.dart';

import 'fetch_data.dart';

class DataGraphBuilder {
  // LISTA DATI PER GRAFICO SCOSTAMENTO MOL NELLA HOMEPAGE
  Future<List<ColumnChartData>> datiGraficoHomepageScostamento() async {
    dynamic data = await FetchData().getData();
    return [
      ColumnChartData(x: 'Ricavi', colonna1: data["ricaviScostamento"]),
      ColumnChartData(
          x: 'Materie Prime', colonna1: data["materiePrimeScostamento"]),
      ColumnChartData(
          x: 'Lavorazioni Interne', colonna1: data["lavorazioniInterne"]),
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
}
