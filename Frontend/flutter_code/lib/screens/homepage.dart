import 'package:flutter/material.dart';
import 'package:frontendscg/database/database.dart';
import 'package:frontendscg/functions/upload_dataset.dart';
import 'package:frontendscg/widgets/column_chart.dart';
import 'package:frontendscg/widgets/pie_chart.dart';
import 'package:frontendscg/widgets/pulsante_altri_scostamenti.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double _scostamentoTotaleMol;
  late double _molBudget;
  late double _molConsuntivo;

  @override
  void initState() {
    _scostamentoTotaleMol = Database().scostamentoTotaleMol;
    _molBudget = Database().budgetMol;
    _molConsuntivo = Database().consuntivoMol;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green[200],
        body: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green[400],
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                  margin: EdgeInsets.only(right: 20),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 200,
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "Scostamento Margine Operativo Lordo:    € ${NumberFormat.currency(name: "").format(_scostamentoTotaleMol)} ",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green[400],
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        margin: const EdgeInsets.only(right: 20),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            // RIGA CON TESTO BUDGET/CONSUNTIVO
                            Flexible(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  // TITOLI BUDGET CONSUNTIVO
                                  Expanded(
                                    flex: 8,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        SizedBox(
                                          width: double.infinity,
                                          child: FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: Text(
                                              "Margine Operativo Lordo Budget:    € ${NumberFormat.currency(name: "").format(_molBudget)} ",
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: Text(
                                              "Margine Operativo Lordo Consuntivo:    € ${NumberFormat.currency(name: "").format(_molConsuntivo)} ",
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // RIGA CON PULSANTI BUDGET/CONSUNTIVO E SCOSTAMENTO
                            Flexible(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  // PULSANTE BUDGET + CONSUNTIVO
                                  Flexible(
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(top: 30, right: 20),
                                      height: 100,
                                      width: 200,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.green),
                                        onPressed: () {},
                                        child:
                                            const Text("Budget + Consuntivo"),
                                      ),
                                    ),
                                  ),

                                  // PULSANTE SCOSTAMENTO
                                  Flexible(
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(top: 30, right: 20),
                                      height: 100,
                                      width: 200,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.green),
                                        onPressed: () {},
                                        child: const Text("Scostamento"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // PIE CHART
                            const Expanded(
                              flex: 5,
                              child: PieChartDrawer(),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green[400],
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      margin: const EdgeInsets.only(right: 20, bottom: 20),
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // COLUMN CHART
                          const Expanded(
                            child: ColumnChartDrawer(),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // PULSANTI PER GLI ALTRI SCOSTAMENTI
                                Container(
                                  margin: const EdgeInsets.only(bottom: 5),
                                  child: const Text(
                                    "Altri Scostamenti: ",
                                    style: TextStyle(fontSize: 35),
                                  ),
                                ),

                                PulsanteAltriScostamenti(
                                  nomeScostamento: "Ricavi",
                                  valoreScostamento:
                                      Database().scostamentoRicavi,
                                ),

                                PulsanteAltriScostamenti(
                                  nomeScostamento: "Materie Prime",
                                  valoreScostamento:
                                      Database().scostamentoMateriePrime,
                                ),

                                PulsanteAltriScostamenti(
                                  nomeScostamento: "Lavorazioni Interne",
                                  valoreScostamento:
                                      Database().scostamentoLavorazioniInterne,
                                ),

                                PulsanteAltriScostamenti(
                                  nomeScostamento: "Costi Totali",
                                  valoreScostamento:
                                      Database().scostamentoCostiTotali,
                                ),

                                PulsanteAltriScostamenti(
                                  nomeScostamento: "Margine Op. Lordo",
                                  valoreScostamento:
                                      Database().scostamentoTotaleMol,
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
          ],
        ),
      ),
    );
  }
}
