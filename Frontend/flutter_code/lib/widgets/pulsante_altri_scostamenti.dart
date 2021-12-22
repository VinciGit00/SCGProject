import 'package:flutter/material.dart';
import 'package:frontendscg/screens/pagina%20secondaria/pagina_secondaria.dart';
import 'package:intl/intl.dart';

// Pulsante per accedere alle pagine secondarie degli scostamenti.
// Questo widget mostra anche il valore dello scostamento legato al pulsante

class PulsanteAltriScostamenti extends StatelessWidget {
  const PulsanteAltriScostamenti(
      {Key? key,
      required this.nomeScostamento,
      required this.dataPath,
      required this.valoreScostamento})
      : super(key: key);

  // Nome scostamento contenuto nel pulsante
  final String nomeScostamento;
  // Valore scostamento presente di fianco al pulsante
  final int valoreScostamento;

  // Nome chiave per accedere ai dati dentro la Map creata dall'api.
  final String dataPath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 200,
            padding: const EdgeInsets.only(right: 35),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.green[700]),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PaginaSecondaria(
                        dataPath: dataPath,
                        titoloPagina: nomeScostamento,
                      );
                    },
                  ),
                );
              },
              child: Text(nomeScostamento),
            ),
          ),

          // Valore Scostamento
          Text(
            "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(valoreScostamento)} ",
            style: const TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
