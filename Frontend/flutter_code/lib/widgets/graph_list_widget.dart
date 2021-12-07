import 'package:flutter/material.dart';
import 'package:frontendscg/widgets/graph_drawer_widget.dart';
import 'package:frontendscg/utils/graph_names.dart';
import 'package:frontendscg/utils/modello_grafico.dart';

// TODO: evitare di fare una request alla api per ogni volta che lo schermo esegue un refresh. Meglio farlo una volta sola.

// QUESTO WIDGET SERVE A COSTRUIRE UNA LISTA CONTENENTE I GRAFICI CHE VENGON PASSATI COME PARAMETRO

class GraphList extends StatefulWidget {
  const GraphList({Key? key, required this.listaGrafici}) : super(key: key);

  // Url base del nostro server
  final String prefixUrl = "http://127.0.0.1:5000";

  // Formato delle immagini mostrate
  final String imageExtension = ".jpeg";

  // Lista di grafici da costruire
  final List<ModelloGrafico> listaGrafici;

  @override
  _GraphListState createState() => _GraphListState();
}

class _GraphListState extends State<GraphList> {
  // late List<String> listaGrafici;

  @override
  void initState() {
    // listaGrafici = GraphNames().graphList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.listaGrafici.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.blue[200]),
          margin: const EdgeInsets.all(25),
          padding: const EdgeInsets.all(25),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Titolo Immagine
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Text(
                        widget.listaGrafici[index].nomeGrafico,
                        style: const TextStyle(fontSize: 30),
                      ),
                    ),

                    // Disegno il grafico
                    // Come parametro passo il nome del singono grafico da disegnare
                    GraphDrawer(
                      nomeDataset: widget.listaGrafici[index].nomeGrafico,
                    )
                  ],
                ),
              ),

              // Descrizione
              Expanded(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: const Text(
                    "Descrizione:",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
