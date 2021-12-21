import 'package:flutter/material.dart';
import 'package:frontendscg/database/database.dart';
import 'package:frontendscg/functions/fetch_data.dart';
import 'package:frontendscg/screens/pagina%20secondaria/blocco_sinistra.dart';
import 'package:frontendscg/screens/pagina%20secondaria/parte_superiore_pagina.dart';
import 'package:frontendscg/utils/data_notifier.dart';
import 'package:frontendscg/widgets/column_chart.dart';
import 'package:provider/provider.dart';

// Questa pagina mostra le informazioni relative al singolo tipo di scostamento
// La pagina è raggiungibile tramite i pulsantiAltriScostamenti presenti sulla home

class PaginaSecondaria extends StatefulWidget {
  const PaginaSecondaria(
      {Key? key, required this.titoloPagina, required this.dataPath})
      : super(key: key);

  // Titolo presente in alto alla pagina
  final String titoloPagina;

  // Chiave per recuperare dati dal file json
  final String dataPath;

  @override
  State<PaginaSecondaria> createState() => _PaginaSecondariaState();
}

class _PaginaSecondariaState extends State<PaginaSecondaria> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green[200],
        body: FutureBuilder<Map<String, dynamic>>(
          future: FetchData().getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  // PARTE SUPERIORE PAGINA
                  ParteSuperiorePagina(
                    titoloPagina: widget.titoloPagina,
                    scostamentoTitolo:
                        snapshot.data!["${widget.dataPath}Scostamento"]!,
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // BLOCCO DI SINISTRA
                          BloccoSinistra(
                            titoloPagina: widget.titoloPagina,
                            budget: snapshot.data!["${widget.dataPath}Budget"]!,
                            consuntivo:
                                snapshot.data!["${widget.dataPath}Consuntivo"]!,
                          ),

                          // BLOCCO DI DESTRA
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.green[400],
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              padding: const EdgeInsets.only(
                                  top: 20, left: 20, right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // GRAFICO
                                  Expanded(
                                    child: Provider.of<DataNotifier>(context)
                                            .isGraficoScostamentoPagSecondaria
                                        ? ColumnChartDrawer(
                                            nomePrimaColonna: "Scostamento",
                                            title:
                                                "Scostamento ${widget.titoloPagina}",
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
