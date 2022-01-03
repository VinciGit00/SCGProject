import 'package:flutter/material.dart';
import 'package:frontendscg/database/constants.dart';
import 'package:frontendscg/widgets/column_chart.dart';
import 'package:frontendscg/widgets/pie_chart.dart';
import 'package:intl/intl.dart';

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
          x: 'Scostamento \nVolume',
          colonna1: data[Names.ricaviScostamentoVol.name]),
      ColumnChartData(
          x: 'Scostamento \nMix',
          colonna1: data[Names.ricaviScostamentoMix.name]),
      ColumnChartData(
          x: 'Scostamento \nPrezzo',
          colonna1: data[Names.ricaviScostamentoPrezzo.name]),
      ColumnChartData(
          x: 'Scostamento \nValuta',
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

  /// Table valori Ricavi
  List<DataRow> valoriColumnRicavi(dynamic data) {
    return [
      DataRow(
        cells: [
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.ricaviBudget.name])} "),
          ),
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.ricaviMixStandard.name])} "),
          ),
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.ricaviMixEffettivo.name])} "),
          ),
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.ricaviMixValuta.name])} "),
          ),
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.ricaviConsuntivo.name])} "),
          ),
        ],
      )
    ];
  }

  // Table scostamenti ricavi
  List<DataRow> scostamentiColumnRicavi(dynamic data) {
    return [
      DataRow(
        cells: [
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.ricaviScostamentoVol.name])} "),
          ),
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.ricaviScostamentoMix.name])} "),
          ),
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.ricaviScostamentoPrezzo.name])} "),
          ),
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.ricaviScostamentoValuta.name])} "),
          ),
        ],
      )
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

  /// Grafico Scostamento Materie Prime
  List<ColumnChartData> materiePrimeScostamentoData(dynamic data) {
    return [
      ColumnChartData(
          x: 'Scostamento \nVolume',
          colonna1: data[Names.materiePrimeScostamentoVol.name]),
      ColumnChartData(
          x: 'Scostamento \nMix',
          colonna1: data[Names.materiePrimeScostamentoMix.name]),
      ColumnChartData(
          x: 'Scostamento \nPrezzo',
          colonna1: data[Names.materiePrimeScostamentoPrezzo.name]),
      ColumnChartData(
          x: 'Scostamento \nValuta',
          colonna1: data[Names.materiePrimeScostamentoValuta.name]),
    ];
  }

  /// Grafico Budget/Consuntivo Materie Prime
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

  /// Table valori Materie Prime
  List<DataRow> valoriColumnMateriePrime(dynamic data) {
    return [
      DataRow(
        cells: [
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.materiePrimeBudget.name])} "),
          ),
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.materiePrimeMixStandard.name])} "),
          ),
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.materiePrimeMixEffettivo.name])} "),
          ),
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.materiePrimeMixValuta.name])} "),
          ),
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.materiePrimeConsuntivo.name])} "),
          ),
        ],
      )
    ];
  }

  // Table scostamenti Materie Prime
  List<DataRow> scostamentiColumnMateriePrime(dynamic data) {
    return [
      DataRow(
        cells: [
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.materiePrimeScostamentoVol.name])} "),
          ),
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.materiePrimeScostamentoMix.name])} "),
          ),
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.materiePrimeScostamentoPrezzo.name])} "),
          ),
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.materiePrimeScostamentoValuta.name])} "),
          ),
        ],
      )
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
          x: 'Scostamento \nVolume',
          colonna1: data[Names.lavorazioniInterneScostamentoVol.name]),
      ColumnChartData(
          x: 'Scostamento \nMix',
          colonna1: data[Names.lavorazioniInterneScostamentoMix.name]),
      ColumnChartData(
          x: 'Scostamento \nPrezzo',
          colonna1: data[Names.lavorazioniInterneScostamentoPrezzo.name]),
      ColumnChartData(
          x: 'Scostamento \nValuta',
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

  /// Table valori Lavorazioni Interne
  List<DataRow> valoriColumnLavorazioniInterne(dynamic data) {
    return [
      DataRow(
        cells: [
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.lavorazioniInterneBudget.name])} "),
          ),
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.lavorazioniInterneMixStandard.name])} "),
          ),
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.lavorazioniInterneMixEffettivo.name])} "),
          ),
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.lavorazioniInterneMixValuta.name])} "),
          ),
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.lavorazioniInterneConsuntivo.name])} "),
          ),
        ],
      )
    ];
  }

  // Table scostamenti Lavorazioni Interne
  List<DataRow> scostamentiColumnLavorazioniInterne(dynamic data) {
    return [
      DataRow(
        cells: [
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.lavorazioniInterneScostamentoVol.name])} "),
          ),
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.lavorazioniInterneScostamentoMix.name])} "),
          ),
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.lavorazioniInterneScostamentoPrezzo.name])} "),
          ),
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.lavorazioniInterneScostamentoValuta.name])} "),
          ),
        ],
      )
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
          x: 'Scostamento \nVolume',
          colonna1: data[Names.costiTotaliScostamentoVol.name]),
      ColumnChartData(
          x: 'Scostamento \nMix',
          colonna1: data[Names.costiTotaliScostamentoMix.name]),
      ColumnChartData(
          x: 'Scostamento \nPrezzo',
          colonna1: data[Names.costiTotaliScostamentoPrezzo.name]),
      ColumnChartData(
          x: 'Scostamento \nValuta',
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

  /// Table valori Costi Totali
  List<DataRow> valoriColumnCostiTotali(dynamic data) {
    return [
      DataRow(
        cells: [
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.costiTotaliBudget.name])} "),
          ),
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.costiTotaliMixStandard.name])} "),
          ),
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.costiTotaliMixEffettivo.name])} "),
          ),
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.costiTotaliMixValuta.name])} "),
          ),
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.costiTotaliConsuntivo.name])} "),
          ),
        ],
      )
    ];
  }

  // Table scostamenti Costi Totali
  List<DataRow> scostamentiColumnCostiTotali(dynamic data) {
    return [
      DataRow(
        cells: [
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.costiTotaliScostamentoVol.name])} "),
          ),
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.costiTotaliScostamentoMix.name])} "),
          ),
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.costiTotaliScostamentoPrezzo.name])} "),
          ),
          DataCell(
            Text(
                "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(data[Names.costiTotaliScostamentoValuta.name])} "),
          ),
        ],
      )
    ];
  }
}
