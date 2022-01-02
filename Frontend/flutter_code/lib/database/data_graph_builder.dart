import 'package:frontendscg/database/constants.dart';
import 'package:frontendscg/widgets/column_chart.dart';
import 'package:frontendscg/widgets/pie_chart.dart';

class DataGraphBuilder {
  ///
  ///////////////////
  // MATERIE PRIME
  ///////////////////
  ///

  /// Grafico Scostamento Ricavi
  List<ColumnChartData> ricaviScostamentoData(dynamic data) {
    return [
      ColumnChartData(
          x: 'Scostamento Volume',
          colonna1: data[Names.ricaviScostamentoVol.name]),
      ColumnChartData(
          x: 'Scostamento Mix',
          colonna1: data[Names.ricaviScostamentoMix.name]),
      ColumnChartData(
          x: 'Scostamento Prezzo',
          colonna1: data[Names.ricaviScostamentoPrezzo.name]),
      ColumnChartData(
          x: 'Scostamento Valuta',
          colonna1: data[Names.ricaviScostamentoValuta.name]),
    ];
  }

  /// Grafico Budget/Consuntivo Ricavi
  List<ColumnChartData> ricaviBudgetConsuntivoData(dynamic data) {
    return [
      ColumnChartData(x: 'Budget', colonna1: data[Names.ricaviBudget.name]),
      ColumnChartData(
          x: 'Mix Standard', colonna1: data[Names.ricaviMixStandard.name]),
      ColumnChartData(
          x: 'Mix Effettivo', colonna1: data[Names.ricaviMixEffettivo.name]),
      ColumnChartData(
          x: 'Mix Valuta', colonna1: data[Names.ricaviMixValuta.name]),
      ColumnChartData(
          x: 'Consuntivo', colonna1: data[Names.ricaviConsuntivo.name])
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
      PieChartData('Ricavi', data[Names.ricaviScostamentoTot.name]),
      PieChartData(
          'Materie Prime', data[Names.materiePrimeScostamentoTot.name]),
      PieChartData('Lavorazioni Interne',
          data[Names.lavorazioniInterneScostamentoTot.name]),
      PieChartData('Costi Totali', data[Names.costiTotaliScostamentoTot.name]),
    ];
  }

// Column Chart scostamento MOL
  List<ColumnChartData> molBudgetConsuntivoData(dynamic data) {
    return [
      ColumnChartData(
          x: 'Ricavi',
          colonna1: data[Names.ricaviBudget.name],
          colonna2: data[Names.ricaviConsuntivo.name]),
      ColumnChartData(
          x: 'Materie Prime',
          colonna1: data[Names.materiePrimeBudget.name],
          colonna2: data[Names.materiePrimeConsuntivo.name]),
      ColumnChartData(
          x: 'Lavorazioni Interne',
          colonna1: data[Names.lavorazioniInterneBudget.name],
          colonna2: data[Names.lavorazioniInterneConsuntivo.name]),
      ColumnChartData(
          x: 'Costi Totali',
          colonna1: data[Names.costiTotaliBudget.name],
          colonna2: data[Names.costiTotaliConsuntivo.name]),
    ];
  }

  // Column Chart Scostamento MOL
  List<ColumnChartData> molScostamentoData(dynamic data) {
    return [
      ColumnChartData(
          x: 'Ricavi', colonna1: data[Names.ricaviScostamentoTot.name]!),
      ColumnChartData(
          x: 'Materie Prime',
          colonna1: data[Names.materiePrimeScostamentoTot.name]!),
      ColumnChartData(
          x: 'Lavorazioni Interne',
          colonna1: data[Names.lavorazioniInterneScostamentoTot.name]!),
      ColumnChartData(
          x: 'Costi Totali',
          colonna1: data[Names.costiTotaliScostamentoTot.name]!),
    ];
  }

  ///
  ///////////////////
  // MATERIE PRIME
  ///////////////////
  ///

  /// Grafico Scostamento Ricavi
  List<ColumnChartData> materiePrimeScostamentoData(dynamic data) {
    return [
      ColumnChartData(
          x: 'Scostamento Volume',
          colonna1: data[Names.materiePrimeScostamentoVol.name]),
      ColumnChartData(
          x: 'Scostamento Mix',
          colonna1: data[Names.materiePrimeScostamentoMix.name]),
      ColumnChartData(
          x: 'Scostamento Prezzo',
          colonna1: data[Names.materiePrimeScostamentoPrezzo.name]),
      ColumnChartData(
          x: 'Scostamento Valuta',
          colonna1: data[Names.materiePrimeScostamentoValuta.name]),
    ];
  }

  /// Grafico Budget/Consuntivo Ricavi
  List<ColumnChartData> materiePrimeBudgetConsuntivoData(dynamic data) {
    return [
      ColumnChartData(
          x: 'Budget', colonna1: data[Names.materiePrimeBudget.name]),
      ColumnChartData(
          x: 'Mix Standard',
          colonna1: data[Names.materiePrimeMixStandard.name]),
      ColumnChartData(
          x: 'Mix Effettivo',
          colonna1: data[Names.materiePrimeMixEffettivo.name]),
      ColumnChartData(
          x: 'Mix Valuta', colonna1: data[Names.materiePrimeMixValuta.name]),
      ColumnChartData(
          x: 'Consuntivo', colonna1: data[Names.materiePrimeConsuntivo.name])
    ];
  }

  ///
  ///////////////////
  // LAVORAZIONI INTERNE
  ///////////////////
  ///

  /// Grafico Scostamento Ricavi
  List<ColumnChartData> lavorazioniInterneScostamentoData(dynamic data) {
    return [
      ColumnChartData(
          x: 'Scostamento Volume',
          colonna1: data[Names.lavorazioniInterneScostamentoVol.name]),
      ColumnChartData(
          x: 'Scostamento Mix',
          colonna1: data[Names.lavorazioniInterneScostamentoMix.name]),
      ColumnChartData(
          x: 'Scostamento Prezzo',
          colonna1: data[Names.lavorazioniInterneScostamentoPrezzo.name]),
      ColumnChartData(
          x: 'Scostamento Valuta',
          colonna1: data[Names.lavorazioniInterneScostamentoValuta.name]),
    ];
  }

  /// Grafico Budget/Consuntivo Ricavi
  List<ColumnChartData> lavorazioniInterneBudgetConsuntivoData(dynamic data) {
    return [
      ColumnChartData(
          x: 'Budget', colonna1: data[Names.lavorazioniInterneBudget.name]),
      ColumnChartData(
          x: 'Mix Standard',
          colonna1: data[Names.lavorazioniInterneMixStandard.name]),
      ColumnChartData(
          x: 'Mix Effettivo',
          colonna1: data[Names.lavorazioniInterneMixEffettivo.name]),
      ColumnChartData(
          x: 'Mix Valuta',
          colonna1: data[Names.lavorazioniInterneMixValuta.name]),
      ColumnChartData(
          x: 'Consuntivo',
          colonna1: data[Names.lavorazioniInterneConsuntivo.name])
    ];
  }

  ///
  ///////////////////
  // COSTI TOTALI
  ///////////////////
  ///

  /// Grafico Scostamento Ricavi
  List<ColumnChartData> costiTotaliScostamentoData(dynamic data) {
    return [
      ColumnChartData(
          x: 'Scostamento Volume',
          colonna1: data[Names.costiTotaliScostamentoVol.name]),
      ColumnChartData(
          x: 'Scostamento Mix',
          colonna1: data[Names.costiTotaliScostamentoMix.name]),
      ColumnChartData(
          x: 'Scostamento Prezzo',
          colonna1: data[Names.costiTotaliScostamentoPrezzo.name]),
      ColumnChartData(
          x: 'Scostamento Valuta',
          colonna1: data[Names.costiTotaliScostamentoValuta.name]),
    ];
  }

  /// Grafico Budget/Consuntivo Ricavi
  List<ColumnChartData> costiTotaliBudgetConsuntivoData(dynamic data) {
    return [
      ColumnChartData(
          x: 'Budget', colonna1: data[Names.costiTotaliBudget.name]),
      ColumnChartData(
          x: 'Mix Standard', colonna1: data[Names.costiTotaliMixStandard.name]),
      ColumnChartData(
          x: 'Mix Effettivo',
          colonna1: data[Names.costiTotaliMixEffettivo.name]),
      ColumnChartData(
          x: 'Mix Valuta', colonna1: data[Names.costiTotaliMixValuta.name]),
      ColumnChartData(
          x: 'Consuntivo', colonna1: data[Names.costiTotaliConsuntivo.name])
    ];
  }
}
