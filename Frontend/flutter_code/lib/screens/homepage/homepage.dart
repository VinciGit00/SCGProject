import 'package:flutter/material.dart';
import 'package:frontendscg/database/constants.dart';
import 'package:frontendscg/database/data_graph_builder.dart';
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
                      scostamento: data![Names.molScostamentoTot.name]!,
                      budget: data![Names.molBudget.name]!,
                      consuntivo: data![Names.molConsuntivo.name]!,
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
                                    dataPath: [
                                      Names.ricaviScostamentoTot.name,
                                      Names.ricaviBudget.name,
                                      Names.ricaviConsuntivo.name
                                    ],
                                    nomeScostamento: "Ricavi",
                                    valoreScostamento:
                                        data![Names.ricaviScostamentoTot.name]!,
                                  ),

                                  //Materie Prime
                                  PulsanteAltriScostamenti(
                                    graficoScostamentoData: DataGraphBuilder()
                                        .materiePrimeScostamentoData(data),
                                    graficoBudgetConsuntivoData:
                                        DataGraphBuilder()
                                            .materiePrimeBudgetConsuntivoData(
                                                data),
                                    dataPath: [
                                      Names.materiePrimeScostamentoTot.name,
                                      Names.materiePrimeBudget.name,
                                      Names.materiePrimeConsuntivo.name
                                    ],
                                    nomeScostamento: "Materie Prime",
                                    valoreScostamento: data![
                                        Names.materiePrimeScostamentoTot.name]!,
                                  ),

                                  // Lavorazioni Interne
                                  PulsanteAltriScostamenti(
                                    graficoScostamentoData: DataGraphBuilder()
                                        .lavorazioniInterneScostamentoData(
                                            data),
                                    graficoBudgetConsuntivoData: DataGraphBuilder()
                                        .lavorazioniInterneBudgetConsuntivoData(
                                            data),
                                    dataPath: [
                                      Names.lavorazioniInterneScostamentoTot
                                          .name,
                                      Names.lavorazioniInterneBudget.name,
                                      Names.lavorazioniInterneConsuntivo.name
                                    ],
                                    nomeScostamento: "Lavorazioni Interne",
                                    valoreScostamento: data![Names
                                        .lavorazioniInterneScostamentoTot
                                        .name]!,
                                  ),

                                  // Costi Totali
                                  PulsanteAltriScostamenti(
                                    graficoScostamentoData: DataGraphBuilder()
                                        .costiTotaliScostamentoData(data),
                                    graficoBudgetConsuntivoData:
                                        DataGraphBuilder()
                                            .costiTotaliBudgetConsuntivoData(
                                                data),
                                    dataPath: [
                                      Names.costiTotaliScostamentoTot.name,
                                      Names.costiTotaliBudget.name,
                                      Names.costiTotaliConsuntivo.name
                                    ],
                                    nomeScostamento: "Costi Totali",
                                    valoreScostamento: data![
                                        Names.costiTotaliScostamentoTot.name]!,
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
