import 'package:flutter/material.dart';
import 'package:frontendscg/database/database.dart';
import 'package:frontendscg/widgets/column_chart.dart';
import 'package:intl/intl.dart';

// QUESTA PAGINA SERVE A MOSTRARE LE INFORMAZIONI RIGUARDO ALTRI SCOSTAMENTI ED E' ACCESSIBILE
// DALLA HOMEPAGE

class PaginaSecondaria extends StatefulWidget {
  const PaginaSecondaria(
      {Key? key,
      required this.titoloPagina,
      required this.valoreBudget,
      required this.valoreConsuntivo})
      : super(key: key);
  final String titoloPagina;
  final int valoreBudget;
  final int valoreConsuntivo;

  @override
  State<PaginaSecondaria> createState() => _PaginaSecondariaState();
}

class _PaginaSecondariaState extends State<PaginaSecondaria> {
  // Booleano che regola quando viene mostrato il grafico del budget e quando quello di consuntivo
  late bool _isGraficoBudget;

  @override
  void initState() {
    _isGraficoBudget = false;
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
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              "${widget.titoloPagina}:    € ${NumberFormat.currency(name: "").format(snapshot.data!["scostamentoTotaleMol"])} ",
                            ),
                          ),
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
                                                      "${widget.titoloPagina} Budget:    € ${NumberFormat.currency(name: "").format(snapshot.data!["budgetMol"])} ",
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: FittedBox(
                                                    fit: BoxFit.fitWidth,
                                                    child: Text(
                                                      "${widget.titoloPagina} Consuntivo:    € ${NumberFormat.currency(name: "").format(snapshot.data!["consuntivoMol"])} ",
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
                                              margin: const EdgeInsets.only(
                                                  top: 30, right: 20),
                                              height: 100,
                                              width: 200,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.green[700]),
                                                onPressed: () {
                                                  setState(() {
                                                    _isGraficoBudget = false;
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
                                              margin: const EdgeInsets.only(
                                                  top: 30, right: 20),
                                              height: 100,
                                              width: 200,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.green[700]),
                                                onPressed: () {
                                                  setState(() {
                                                    _isGraficoBudget = true;
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
                                    child: _isGraficoBudget
                                        ? ColumnChartDrawer(
                                            nomePrimaColonna: "Scostamento",
                                            title: "Scostamento MOL",
                                            data: Database().scostamentoMolData,
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
