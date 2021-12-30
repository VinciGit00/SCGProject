import 'package:flutter/material.dart';
import 'package:frontendscg/utils/data_notifier_home.dart';
import 'package:frontendscg/widgets/pie_chart.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BloccoSinistraHome extends StatefulWidget {
  const BloccoSinistraHome({
    Key? key,
    required this.budget,
    required this.consuntivo,
    required this.scostamento,
  }) : super(key: key);

  // Valore budget mol
  final int budget;
  // Valore consuntivo mol
  final int consuntivo;
  // Valore scostamento mol
  final int scostamento;

  @override
  _BloccoSinistraHomeState createState() => _BloccoSinistraHomeState();
}

class _BloccoSinistraHomeState extends State<BloccoSinistraHome> {
  late Size size;

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

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
        padding: const EdgeInsets.only(top: 25, bottom: 5, left: 25, right: 25),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              flex: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // LABEL TITOLO SCOSTAMENTO MOL
                      Text(
                        "Scostamento:",
                        style: TextStyle(fontSize: size.width / 40),
                      ),

                      // LABEL TITOLO MOL BUDGET
                      Text(
                        "Budget:",
                        style: TextStyle(fontSize: size.width / 40),
                      ),

                      // LABEL TITOLO MOL CONSUNTIVO
                      Text(
                        "Consuntivo:",
                        style: TextStyle(fontSize: size.width / 40),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // LABEL VALORE SCOSTAMENTO MOL
                      Text(
                        "€ ${NumberFormat.currency(name: "").format(widget.scostamento)} ",
                        style: TextStyle(fontSize: size.width / 40),
                      ),

                      // LABEL VALORE MOL BUDGET
                      Text(
                        "€ ${NumberFormat.currency(name: "").format(widget.budget)} ",
                        style: TextStyle(fontSize: size.width / 40),
                      ),

                      // LABEL VALORE MOL CONSUNTIVO
                      Text(
                        "€ ${NumberFormat.currency(name: "").format(widget.consuntivo)} ",
                        style: TextStyle(fontSize: size.width / 40),
                      ),
                    ],
                  )
                ],
              ),
            ),

            Flexible(
              flex: 2,
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
              flex: 9,
              child: PieChartDrawer(),
            )
          ],
        ),
      ),
    );
  }
}
