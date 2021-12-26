import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Parte superiore della pagina secondaria. Qui sono contenuti il titolo e il pulsante back

class ParteSuperiorePagina extends StatelessWidget {
  const ParteSuperiorePagina({
    Key? key,
    required this.titoloPagina,
  }) : super(key: key);

  final String titoloPagina;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 20, left: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green[400],
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          margin: const EdgeInsets.only(right: 20),
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // PULSANTE BACK
              Expanded(
                child: Container(
                  height: 70,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: IconButton(
                      iconSize: 50,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                ),
              ),

              // TITOLO
              Expanded(
                flex: 10,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 500,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Text(
                      titoloPagina,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
