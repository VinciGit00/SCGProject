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
      required this.scostamento,
      required this.consuntivo})
      : super(key: key);

  final String titoloPagina;
  final int scostamento;
  final int budget;
  final int consuntivo;

  @override
  _BloccoSinistraState createState() => _BloccoSinistraState();
}

class _BloccoSinistraState extends State<BloccoSinistra> {
  late Size size;

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  List<DataColumn> dataC = [
    DataColumn(
      label: Text("Colonna1"),
    ),
    DataColumn(
      label: Text("Colonna1"),
    ),
    DataColumn(
      label: Text("Colonna1"),
    ),
    DataColumn(
      label: Text("Colonna1"),
    ),
    DataColumn(
      label: Text("Colonna1"),
    )
  ];

  List<DataRow> dataR = [
    DataRow(cells: [
      DataCell(
        Text("odaidiill"),
      ),
      DataCell(
        Text("odaidiill"),
      ),
      DataCell(
        Text("odaidiill"),
      ),
      DataCell(
        Text("odaidiill"),
      ),
      DataCell(
        Text("odaidiill"),
      ),
    ]),
    DataRow(cells: [
      DataCell(
        Text("odaidiill"),
      ),
      DataCell(
        Text("odaidiill"),
      ),
      DataCell(
        Text("odaidiill"),
      ),
      DataCell(
        Text("odaidiill"),
      ),
      DataCell(
        Text("odaidiill"),
      ),
    ]),
  ];

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
          children: <Widget>[
            // RIGA CON TESTO BUDGET/CONSUNTIVO
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // LABEL SCOSTAMENTO MOL
                    Text(
                      "Scostamento:",
                      style: TextStyle(fontSize: size.width / 40),
                    ),

                    // LABEL MOL BUDGET
                    Text(
                      "Budget:",
                      style: TextStyle(fontSize: size.width / 40),
                    ),

                    // LABEL MOL CONSUNTIVO
                    Text(
                      "Consuntivo:",
                      style: TextStyle(fontSize: size.width / 40),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // LABEL SCOSTAMENTO
                    Text(
                      "€ ${NumberFormat.currency(name: "").format(widget.scostamento)} ",
                      style: TextStyle(fontSize: size.width / 40),
                    ),

                    // LABEL BUDGET
                    Text(
                      "€ ${NumberFormat.currency(name: "").format(widget.budget)} ",
                      style: TextStyle(fontSize: size.width / 40),
                    ),

                    // LABEL CONSUNTIVO
                    Text(
                      "€ ${NumberFormat.currency(name: "").format(widget.consuntivo)} ",
                      style: TextStyle(fontSize: size.width / 40),
                    ),
                  ],
                ),
              ],
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
                      height: 55,
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
                      height: 55,
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

            // TABELLA DATI
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: DataTable(
                border: TableBorder(borderRadius: BorderRadius.circular(8)),
                columns: dataC,
                rows: dataR,
              ),
            )
          ],
        ),
      ),
    );
  }
}