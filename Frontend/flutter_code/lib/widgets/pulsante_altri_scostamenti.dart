import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PulsanteAltriScostamenti extends StatelessWidget {
  const PulsanteAltriScostamenti(
      {Key? key,
      required this.nomeScostamento,
      required this.valoreScostamento})
      : super(key: key);

  final String nomeScostamento;
  final double valoreScostamento;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500, 
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 200,
            padding: const EdgeInsets.only(right: 35),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(nomeScostamento),
            ),
          ),
          Text(
            "€ ${NumberFormat.currency(name: "").format(valoreScostamento)} ",
            style: const TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
