import 'package:flutter/material.dart';
import 'package:frontendscg/database/data_graph_builder.dart';
import 'package:frontendscg/functions/fetch_data.dart';
import 'package:frontendscg/screens/pagina%20secondaria/blocco_sinistra.dart';
import 'package:frontendscg/screens/pagina%20secondaria/parte_superiore_pagina.dart';
import 'package:frontendscg/utils/data_notifier.dart';
import 'package:frontendscg/utils/data_provider.dart';
import 'package:frontendscg/widgets/column_chart.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// Questa pagina mostra le informazioni relative al singolo tipo di scostamento
// La pagina è raggiungibile tramite i pulsantiAltriScostamenti presenti sulla home

class PaginaSecondaria extends StatefulWidget {
  const PaginaSecondaria(
      {Key? key,
      required this.titoloPagina,
      required this.dataPath,
      required this.graficoScostamentoData,
      required this.graficoBudgetConsuntivoData})
      : super(key: key);

  // Titolo presente in alto alla pagina
  final String titoloPagina;

  // Chiave per recuperare dati dal file json
  final String dataPath;

  // Function that returns data for the column graph
  final dynamic graficoScostamentoData;

  // Function that returns data for the column graph
  final dynamic graficoBudgetConsuntivoData;

  @override
  State<PaginaSecondaria> createState() => _PaginaSecondariaState();
}

class _PaginaSecondariaState extends State<PaginaSecondaria> {
  late Map<String, dynamic> getDataGraphBudgetConsuntivo;
  late Map<String, dynamic> getDataGraphScostamento;

  @override
  void initState() {
    /* WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      getDataGraphBudgetConsuntivo = {
        widget.dataPath: DataGraphBuilder().datiGraficoHomepageBudgetConsuntivo(
            Provider.of<DataProvider>(context, listen: false))
      };
    });
 */
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dynamic data = Provider.of<DataProvider>(context).data;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.green[200],
          body: Column(
            children: [
              // PARTE SUPERIORE PAGINA
              ParteSuperiorePagina(
                titoloPagina: widget.titoloPagina,
              ),
              Expanded(
                flex: 5,
                child: Container(
                  margin: const EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // BLOCCO DI SINISTRA
                      BloccoSinistra(
                        scostamento: data["${widget.dataPath}Scostamento"]!,
                        titoloPagina: widget.titoloPagina,
                        budget: data!["${widget.dataPath}Budget"]!,
                        consuntivo: data!["${widget.dataPath}Consuntivo"]!,
                      ),

                      // BLOCCO DI DESTRA
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green[400],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // GRAFICO
                              Provider.of<DataNotifier>(context)
                                      .isGraficoScostamentoPagSecondaria
                                  ? ColumnChartDrawer(
                                      title: "Scostamenti Ricavi",
                                      nomePrimaColonna: "Scostamento",
                                      data: widget.graficoBudgetConsuntivoData)
                                  : ColumnChartDrawer(
                                      title: "Budget & Consuntivo Ricavi",
                                      nomePrimaColonna: "Value",
                                      data: widget.graficoScostamentoData,

                                      /* SfCartesianChart(
                                    series: <ChartSeries>[
                                      HistogramSeries<double, double>(
                                        yValueMapper: (sales, _) => sales,
                                        dataSource: <double>[
                                          3,
                                          4,
                                          23,
                                          42,
                                          4,
                                          234,
                                          2,
                                          4,
                                          12,
                                          3
                                        ],
                                        showNormalDistributionCurve: true,
                                        curveColor: const Color.fromRGBO(
                                            192, 108, 132, 1),
                                        binInterval: 20,
                                      )
                                    ],
                                  )
 */
                                    )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
