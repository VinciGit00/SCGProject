import 'package:flutter/material.dart';
import 'package:frontendscg/utils/data_notifier_home.dart';
import 'package:frontendscg/widgets/pie_chart.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BloccoSinistraHome extends StatefulWidget {
  const BloccoSinistraHome(
      {Key? key, required this.budget, required this.consuntivo})
      : super(key: key);
  final int budget;
  final int consuntivo;
  @override
  _BloccoSinistraHomeState createState() => _BloccoSinistraHomeState();
}

class _BloccoSinistraHomeState extends State<BloccoSinistraHome> {
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
            Flexible(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        // LABEL MOL BUDGET
                        SizedBox(
                          width: double.infinity,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              "Margine Operativo Lordo Budget:    € ${NumberFormat.currency(name: "").format(widget.budget)} ",
                            ),
                          ),
                        ),

                        // LABEL MOL CONSUNTIVO
                        SizedBox(
                          width: double.infinity,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              "Margine Operativo Lordo Consuntivo:    € ${NumberFormat.currency(name: "").format(widget.consuntivo)} ",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // PULSANTE CHANGE GRAFICO TO BUDGET + CONSUNTIVO
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.only(top: 30, right: 20),
                      height: 100,
                      width: 200,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green[700]),
                        onPressed: () {
                          Provider.of<DataNotifierHome>(context, listen: false)
                              .showGraficoBudgetConsuntivo();
                        },
                        child: const Text(
                          "Overview \nBudget + Consuntivo",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),

                  // PULSANTE CHANGE GRAFICO TO SCOSTAMENTO
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.only(top: 30, right: 20),
                      height: 100,
                      width: 200,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green[700]),
                        onPressed: () {
                          Provider.of<DataNotifierHome>(context, listen: false)
                              .showGraficoScostamento();
                        },
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
    );
  }
}
