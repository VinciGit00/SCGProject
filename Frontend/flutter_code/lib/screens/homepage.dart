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
          body: FutureBuilder<Map<String, int>>(
            future: Database().molData, 
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(top: 20, left: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green[400],
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          margin: const EdgeInsets.only(right: 20),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex: 6,
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 200,
                                  child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(
                                      "Scostamento Margine Operativo Lordo:    € ${NumberFormat.currency(name: "").format(snapshot.data!["scostamentoTotaleMol"])} ",
                                    ),
                                  ),
                                ),
                              ),

                              // PULSANTE UPLOAD DATASET
                              Expanded(
                                child: Container(
                                  height: 70,
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.green[700]),
                                    onPressed: () {
                                      UploadDataset().upload();
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: const <Widget>[
                                        Expanded(
                                          flex: 3,
                                          child: Text("Upload a new dataset: "),
                                        ),
                                        Expanded(
                                          child: Icon(Icons.upload),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                //margin: const EdgeInsets.only(left: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.green[400],
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                  ),
                                  margin: const EdgeInsets.only(right: 20),
                                  padding: const EdgeInsets.all(25),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      // RIGA CON TESTO BUDGET/CONSUNTIVO
                                      Flexible(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                                        "Margine Operativo Lordo Budget:    € ${NumberFormat.currency(name: "").format(snapshot.data!["budgetMol"])} ",
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: double.infinity,
                                                    child: FittedBox(
                                                      fit: BoxFit.fitWidth,
                                                      child: Text(
                                                        "Margine Operativo Lordo Consuntivo:    € ${NumberFormat.currency(name: "").format(snapshot.data!["consuntivoMol"])} ",
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            // PULSANTE BUDGET + CONSUNTIVO
                                            Flexible(
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    top: 30, right: 20),
                                                height: 100,
                                                width: 200,
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          primary: Colors
                                                              .green[700]),
                                                  onPressed: () {
                                                    setState(() {
                                                      _isGraficoScostamento =
                                                          false;
                                                    });
                                                  },
                                                  child: const Text(
                                                    "Overview \nBudget + Consuntivo",
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ),

                                            // PULSANTE SCOSTAMENTO
                                            Flexible(
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    top: 30, right: 20),
                                                height: 100,
                                                width: 200,
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          primary: Colors
                                                              .green[700]),
                                                  onPressed: () {
                                                    setState(() {
                                                      _isGraficoScostamento =
                                                          true;
                                                    });
                                                  },
                                                  child:
                                                      const Text("Scostamento"),
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
                                //margin: const EdgeInsets.only(right: 20, bottom: 20),
                                padding: const EdgeInsets.only(
                                    top: 20, left: 20, right: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    // GRAFICO
                                    Expanded(
                                      child: _isGraficoScostamento
                                          ? ColumnChartDrawer(
                                              nomePrimaColonna: "Scostamento",
                                              title: "Scostamento MOL",
                                              data:
                                                  Database().scostamentoMolData,
                                            )
                                          : ColumnChartDrawer(
                                              title:
                                                  "Overview Budget e Consuntivo",
                                              nomePrimaColonna: "Budget",
                                              nomeSecondaColonna: "Consuntivo",
                                              secondaColonna: true,
                                              data: Database()
                                                  .budgetConsuntivoMolData,
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
                                            nomeScostamento: "Ricavi",
                                            valoreScostamento:
                                                Database().scostamentoRicavi,
                                          ),

                                          PulsanteAltriScostamenti(
                                            nomeScostamento: "Materie Prime",
                                            valoreScostamento: Database()
                                                .scostamentoMateriePrime,
                                          ),

                                          PulsanteAltriScostamenti(
                                            nomeScostamento:
                                                "Lavorazioni Interne",
                                            valoreScostamento: Database()
                                                .scostamentoLavorazioniInterne,
                                          ),

                                          PulsanteAltriScostamenti(
                                            nomeScostamento: "Costi Totali",
                                            valoreScostamento: Database()
                                                .scostamentoCostiTotali,
                                          ),

                                          PulsanteAltriScostamenti(
                                            nomeScostamento:
                                                "Margine Op. Lordo",
                                            valoreScostamento:
                                                snapshot.data!["scostamentoTotaleMol"]!,
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
          )),
    );
  }
}
