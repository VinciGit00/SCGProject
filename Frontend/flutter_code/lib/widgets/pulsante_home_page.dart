import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// QUESTO WIDGET RAPPRESENTA I PULSANTI RETTANGOLARI CHE SI TROVANO NELLA HOME PAGE


class PulsanteHomePage extends StatelessWidget {
  const PulsanteHomePage({Key? key, required this.route, required this.title}) : super(key: key);

  // Route per la pagina a cui voglio andare quando il pulsante viene premuto
  final dynamic route;

  // Titolo del pulsante
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration.zero,
            pageBuilder:  (context, _, __) {
              return route;
            },
          ),
        );
      },
      child: Container(
        height: 250,
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue[400],
        ),
        child:  Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
