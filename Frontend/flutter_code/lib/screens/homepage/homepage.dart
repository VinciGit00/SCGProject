import 'package:flutter/material.dart';
import 'package:frontendscg/database/data_graph_builder.dart';
import 'package:frontendscg/functions/fetch_data.dart';
import 'package:frontendscg/screens/homepage/blocco_sinistra_home.dart';
import 'package:frontendscg/screens/homepage/parte_superiore_pagina_home.dart';
import 'package:frontendscg/utils/data_notifier_home.dart';
import 'package:frontendscg/utils/data_provider.dart';
import 'package:frontendscg/widgets/column_chart.dart';
import 'package:frontendscg/widgets/pulsante_altri_scostamenti.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    dynamic data = Provider.of<DataProvider>(context).data;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green[200],
        body: Column(
          children: [
            // PARTE SUPERIORE PAGINA
            const ParteSuperiorePaginaHome(),
            Expanded(
              flex: 5,
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // BLOCCO SINISTRA
                    BloccoSinistraHome(
                      scostamento: data!["molScostamento"],
                      budget: data!["molBudget"],
                      consuntivo: data!["molConsuntivo"],
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
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // GRAFICO
                            Expanded(
                              child: Provider.of<DataNotifierHome>(context)
                                      .isGraficoScostamentoHome
                                  ? ColumnChartDrawer(
                                      nomePrimaColonna: "Scostamento",
                                      title: "Scostamento MOL",
                                      data: DataGraphBuilder()
                                          .molScostamentoData(data),
                                    )
                                  : ColumnChartDrawer(
                                      title: "Overview Budget e Consuntivo",
                                      nomePrimaColonna: "Budget",
                                      nomeSecondaColonna: "Consuntivo",
                                      secondaColonna: true,
                                      data: DataGraphBuilder()
                                          .molBudgetConsuntivoData(data),
                                    ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  // PULSANTI PER GLI ALTRI SCOSTAMENTI
                                  const Text(
                                    "Altri Scostamenti: ",
                                    style: TextStyle(fontSize: 35),
                                  ),

                                  // Ricavi
                                  PulsanteAltriScostamenti(
                                    graficoScostamentoData: DataGraphBuilder()
                                        .ricaviScostamentoData(data),
                                    graficoBudgetConsuntivoData:
                                        DataGraphBuilder()
                                            .ricaviBudgetConsuntivoData(data),
                                    dataPath: "ricavi",
                                    nomeScostamento: "Ricavi",
                                    valoreScostamento:
                                        data!["ricaviScostamento"]!,
                                  ),

                                  //Materie Prime
                                  PulsanteAltriScostamenti(
                                    graficoScostamentoData: DataGraphBuilder()
                                        .ricaviScostamentoData(data),
                                    graficoBudgetConsuntivoData:
                                        DataGraphBuilder()
                                            .ricaviBudgetConsuntivoData(data),
                                    dataPath: "materiePrime",
                                    nomeScostamento: "Materie Prime",
                                    valoreScostamento:
                                        data!["ricaviScostamento"]!,
                                  ),

                                  PulsanteAltriScostamenti(
                                    graficoScostamentoData: DataGraphBuilder()
                                        .ricaviScostamentoData(data),
                                    graficoBudgetConsuntivoData:
                                        DataGraphBuilder()
                                            .ricaviBudgetConsuntivoData(data),
                                    dataPath: "lavorazioniInterne",
                                    nomeScostamento: "Lavorazioni Interne",
                                    valoreScostamento:
                                        data!["ricaviScostamento"]!,
                                  ),

                                  PulsanteAltriScostamenti(
                                    graficoScostamentoData: DataGraphBuilder()
                                        .ricaviScostamentoData(data),
                                    graficoBudgetConsuntivoData:
                                        DataGraphBuilder()
                                            .ricaviBudgetConsuntivoData(data),
                                    dataPath: "costi",
                                    nomeScostamento: "Costi Totali",
                                    valoreScostamento:
                                        data!["ricaviScostamento"]!,
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
        ),
      ),
    );
  }
}
