import 'package:flutter/material.dart';
import 'package:frontendscg/database/database.dart';
import 'package:frontendscg/functions/data_graph_builder.dart';
import 'package:frontendscg/functions/fetch_data.dart';
import 'package:frontendscg/functions/upload_dataset.dart';
import 'package:frontendscg/screens/homepage/blocco_sinistra_home.dart';
import 'package:frontendscg/screens/homepage/parte_superiore_pagina_home.dart';
import 'package:frontendscg/utils/data_notifier_home.dart';
import 'package:frontendscg/widgets/column_chart.dart';
import 'package:frontendscg/widgets/pie_chart.dart';
import 'package:frontendscg/widgets/pulsante_altri_scostamenti.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Booleano che regola quando viene mostrato il grafico dello scostamento e quando quello di budget/consuntivo
  late bool _isGraficoScostamento;

  @override
  void initState() {
    _isGraficoScostamento = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green[200],
        body: FutureBuilder<Map<String, dynamic>>(
          future: FetchData().getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  ParteSuperiorePaginaHome(
                    scostamentoTitolo: snapshot.data!["molScostamento"],
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // BLOCCO SINISTRA
                          BloccoSinistraHome(
                            budget: snapshot.data!["molBudget"],
                            consuntivo: snapshot.data!["molConsuntivo"],
                          ),

                          // BLOCCO DESTRA
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.green[400],
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              padding: const EdgeInsets.only(
                                  top: 20, left: 20, right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // GRAFICO
                                  Expanded(
                                    child:
                                        Provider.of<DataNotifierHome>(context)
                                                .isGraficoScostamentoHome
                                            ? ColumnChartDrawer(
                                                nomePrimaColonna: "Scostamento",
                                                title: "Scostamento MOL",
                                                data: DataGraphBuilder()
                                                    .datiGraficoHomepageScostamento(),
                                              )
                                            : ColumnChartDrawer(
                                                title:
                                                    "Overview Budget e Consuntivo",
                                                nomePrimaColonna: "Budget",
                                                nomeSecondaColonna:
                                                    "Consuntivo",
                                                secondaColonna: true,
                                                data: DataGraphBuilder()
                                                    .datiGraficoHomepageBudgetConsuntivo(),
                                              ),
                                  ),

                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        // PULSANTI PER GLI ALTRI SCOSTAMENTI
                                        const Text(
                                          "Altri Scostamenti: ",
                                          style: TextStyle(fontSize: 35),
                                        ),

                                        PulsanteAltriScostamenti(
                                          dataPath: "ricavi",
                                          nomeScostamento: "Ricavi",
                                          valoreScostamento: snapshot
                                              .data!["ricaviScostamento"]!,
                                        ),

                                        PulsanteAltriScostamenti(
                                          dataPath: "materiePrime",
                                          nomeScostamento: "Materie Prime",
                                          valoreScostamento: snapshot
                                              .data!["ricaviScostamento"]!,
                                        ),

                                        PulsanteAltriScostamenti(
                                          dataPath: "lavorazioniInterne",
                                          nomeScostamento:
                                              "Lavorazioni Interne",
                                          valoreScostamento: snapshot
                                              .data!["ricaviScostamento"]!,
                                        ),

                                        PulsanteAltriScostamenti(
                                          dataPath: "costi",
                                          nomeScostamento: "Costi Totali",
                                          valoreScostamento: snapshot
                                              .data!["ricaviScostamento"]!,
                                        ),

                                        PulsanteAltriScostamenti(
                                          dataPath: "mol",
                                          nomeScostamento: "Margine Op. Lordo",
                                          valoreScostamento: snapshot
                                              .data!["ricaviScostamento"]!,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
