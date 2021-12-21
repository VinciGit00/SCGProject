import 'package:flutter/material.dart';
import 'package:frontendscg/utils/data_notifier.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// Blocco sinistro contentente diversi widget, presente nella PaginaSecondaria

class BloccoSinistra extends StatefulWidget {
  const BloccoSinistra(
      {Key? key,
      required this.titoloPagina,
      required this.budget,
      required this.consuntivo})
      : super(key: key);

  final String titoloPagina;
  final int budget;
  final int consuntivo;

  @override
  _BloccoSinistraState createState() => _BloccoSinistraState();
}

class _BloccoSinistraState extends State<BloccoSinistra> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // TITOLI BUDGET/CONSUNTIVO
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          width: double.infinity,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              "${widget.titoloPagina} Budget:    € ${NumberFormat.currency(name: "").format(widget.budget)} ",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              "${widget.titoloPagina} Consuntivo:    € ${NumberFormat.currency(name: "").format(widget.consuntivo)} ",
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
                      margin: const EdgeInsets.only(top: 30, right: 20),
                      height: 100,
                      width: 200,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green[700]),
                        onPressed: () {
                          Provider.of<DataNotifier>(context, listen: false)
                              .showGraficoBudgetConsuntivo();
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
                      margin: const EdgeInsets.only(top: 30, right: 20),
                      height: 100,
                      width: 200,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green[700]),
                        onPressed: () {
                          Provider.of<DataNotifier>(context, listen: false)
                              .showGraficoScostamento();
                        },
                        child: const Text("Scostamento"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
