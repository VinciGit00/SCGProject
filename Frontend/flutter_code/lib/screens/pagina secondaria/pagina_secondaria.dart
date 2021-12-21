import 'package:flutter/material.dart';
import 'package:frontendscg/database/database.dart';
import 'package:frontendscg/functions/fetch_data.dart';
import 'package:frontendscg/screens/pagina%20secondaria/blocco_sinistra.dart';
import 'package:frontendscg/screens/pagina%20secondaria/parte_superiore_pagina.dart';
import 'package:frontendscg/widgets/column_chart.dart';

// Questa pagina mostra le informazioni relative al singolo tipo di scostamento
// La pagina è raggiungibile tramite i pulsantiAltriScostamenti presenti sulla home

class PaginaSecondaria extends StatefulWidget {
  const PaginaSecondaria({
    Key? key,
    required this.titoloPagina,
  }) : super(key: key);

  final String titoloPagina;

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
        body: FutureBuilder<Map<String, dynamic>>(
          future: FetchData().getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  // PARTE SUPERIORE PAGINA
                  ParteSuperiorePagina(
                    titoloPagina: widget.titoloPagina,
                    scostamentoTitolo: snapshot.data!["scostamentoRicavi"]!,
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
                            budget: snapshot.data!["ricaviBudget"]!,
                            consuntivo: snapshot.data!["ricaviConsuntivo"]!,
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
