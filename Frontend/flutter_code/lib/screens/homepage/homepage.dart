import 'package:flutter/material.dart';
import 'package:frontendscg/database/constants.dart';
import 'package:frontendscg/database/data_graph_builder.dart';
import 'package:frontendscg/screens/homepage/blocco_sinistra_home.dart';
import 'package:frontendscg/screens/homepage/lista_pulsanti_altri_articoli.dart';
import 'package:frontendscg/screens/homepage/parte_superiore_pagina_home.dart';
import 'package:frontendscg/screens/pagina%20scostamenti%20articoli/pagina_scostamenti_articoli.dart';
import 'package:frontendscg/utils/data_notifier_home.dart';
import 'package:frontendscg/utils/data_provider.dart';
import 'package:frontendscg/widgets/column_chart.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Size size;

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    dynamic data = Provider.of<DataProvider>(context).data;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorData().sfondoPagina,
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
                    Expanded(
                      flex: 5,
                      child: BloccoSinistraHome(
                        scostamento: data![Names.molScostamentoTot.name]!,
                        budget: data![Names.molBudget.name]!,
                        consuntivo: data![Names.molConsuntivo.name]!,
                      ),
                    ),

                    // BLOCCO DESTRA
                    Flexible(
                      flex: 6,
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorData().blocchiPagina,
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
                                      title: "Scostamenti",
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

                            // LISTA PULSANTI ALTRI SCOSTAMENTI
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: ListaPulsantiAltriScostamenti(data),
                                  ),

                                  // PULSANTE PAGINA SCOSTAMENTI ARTICOLI
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        bottom: 30,
                                        right: size.width / 50,
                                        left: size.width / 50,
                                      ),
                                      height: 70,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: ColorData().pulsanti,
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return const PaginaScostamentiArticoli();
                                              },
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          "Liste Scostamenti Articoli",
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
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
