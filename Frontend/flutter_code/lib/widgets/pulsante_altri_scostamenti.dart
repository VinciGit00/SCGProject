import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PulsanteAltriScostamenti extends StatelessWidget {
  const PulsanteAltriScostamenti(
      {Key? key,
      required this.nomeScostamento,
      required this.valoreScostamento})
      : super(key: key);

  final String nomeScostamento;
  final int valoreScostamento;

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
              onPressed: () {},
              child: Text(nomeScostamento),
            ),
          ),
          Text(
            "€ ${NumberFormat.currency(name: "", decimalDigits: 0).format(valoreScostamento)} ",
            style: const TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
