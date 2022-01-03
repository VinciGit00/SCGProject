import 'package:flutter/material.dart';
import 'package:frontendscg/database/constants.dart';
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
      required this.consuntivo,
      required this.rigaTabellaValori,
      required this.rigaTabellaScostamenti})
      : super(key: key);

  final String titoloPagina;
  final double scostamento;
  final double budget;
  final double consuntivo;
  final List<DataRow> rigaTabellaScostamenti;
  final List<DataRow> rigaTabellaValori;

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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorData().blocchiPagina,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      margin: const EdgeInsets.only(right: 20),
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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

          // TABELLA DATI
          Container(
            margin: const EdgeInsets.only(top: 50),
            child: DataTable(
              border: TableBorder(borderRadius: BorderRadius.circular(8)),
              // Nomi colonne
              columns: const <DataColumn>[
                DataColumn(
                  label: Text("Budget"),
                ),
                DataColumn(
                  label: Text("Mix Standard"),
                ),
                DataColumn(
                  label: Text("MixEffettivo"),
                ),
                DataColumn(
                  label: Text("Mix Valuta"),
                ),
                DataColumn(
                  label: Text("Consuntivo"),
                ),
              ],
              rows: widget.rigaTabellaValori,
            ),
          ),

          // TABELLA DATI 2
          Container(
            margin: const EdgeInsets.only(top: 50),
            child: DataTable(
              border: TableBorder(borderRadius: BorderRadius.circular(8)),
              // Nomi colonne
              columns: const <DataColumn>[
                DataColumn(
                  label: Text("Scostamento \nVolume"),
                ),
                DataColumn(
                  label: Text("Scostamento \nMix"),
                ),
                DataColumn(
                  label: Text("Scostamento \nPrezzo"),
                ),
                DataColumn(
                  label: Text("Scostamento \nValuta"),
                ),
              ],
              rows: widget.rigaTabellaScostamenti,
            ),
          ),
        ],
      ),
    );
  }
}
