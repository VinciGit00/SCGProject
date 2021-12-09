import 'package:flutter/material.dart';
import 'package:frontendscg/database/database.dart';
import 'package:frontendscg/widgets/graph_list_widget.dart';

class PaginaScostamentiCosti extends StatefulWidget {
  const PaginaScostamentiCosti({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _PaginaScostamentiCostiState createState() => _PaginaScostamentiCostiState();
}

class _PaginaScostamentiCostiState extends State<PaginaScostamentiCosti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue[200],
        ),
        child: GraphList(
          listaGrafici: Database().scostamentiCosti,
        ),
      ),
    );
  }
}
