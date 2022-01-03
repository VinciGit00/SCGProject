import 'package:flutter/material.dart';
import 'package:frontendscg/database/constants.dart';
import 'package:frontendscg/database/liste_scostamenti_builder.dart';
import 'package:frontendscg/screens/pagina%20scostamenti%20articoli/list_builder.dart';
import 'package:frontendscg/screens/pagina%20secondaria/parte_superiore_pagina.dart';

class PaginaScostamentiArticoli extends StatefulWidget {
  const PaginaScostamentiArticoli({Key? key}) : super(key: key);

  @override
  _PaginaScostamentiArticoliState createState() =>
      _PaginaScostamentiArticoliState();
}

class _PaginaScostamentiArticoliState extends State<PaginaScostamentiArticoli> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorData().sfondoPagina,
      body: Container(
        decoration: BoxDecoration(
          //color: ColorData().blocchiPagina,
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const ParteSuperiorePagina(titoloPagina: "Scostamenti Articoli"),
            Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      // SCOSTAMENTI VOLUME
                      ListBuilder(
                          ListeScostamentiBuilder().listaScostamentiVolume,
                          "Scostamento \nVolume"),

                      // SCOSTAMENTI MIX
                      ListBuilder(ListeScostamentiBuilder().listaScostamentiMix,
                          "Scostamento \nMix"),

                      // SCOSTAMENTI PREZZO
                      ListBuilder(
                          ListeScostamentiBuilder().listaScostamentiPrezzo,
                          "Scostamento \nPrezzo"),

                      // SCOSTAMENTI VALUTA
                      ListBuilder(
                          ListeScostamentiBuilder().listaScostamentiValuta,
                          "Scostamento \nValuta"),

                      // SCOSTAMENTI TOTALI
                      ListBuilder(
                          ListeScostamentiBuilder().listaScostamentiTotale,
                          "Scostamento \nTotale"),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
