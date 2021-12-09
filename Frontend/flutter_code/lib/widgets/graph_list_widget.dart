import 'package:flutter/material.dart';
import 'package:frontendscg/widgets/graph_drawer_widget.dart';
import 'package:frontendscg/utils/modello_grafico.dart';

// QUESTO WIDGET SERVE A COSTRUIRE UNA LISTA CONTENENTE I GRAFICI PASSATI COME PARAMETRO

class GraphList extends StatefulWidget {
  const GraphList({Key? key, required this.listaGrafici}) : super(key: key);

  // Lista di grafici da costruire
  final List<ModelloGrafico> listaGrafici;

  @override
  _GraphListState createState() => _GraphListState();
}

class _GraphListState extends State<GraphList> { 

  @override
  Widget build(BuildContext context) {
    // Itero i grafici e li costruisco uno ad uno
    return ListView.builder(
      cacheExtent: 1000000,
      itemCount: widget.listaGrafici.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue[200],
          ),
          margin: const EdgeInsets.all(25),
          padding: const EdgeInsets.all(25),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Titolo Immagine
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(
                          widget.listaGrafici[index].nomeGrafico,
                          style: const TextStyle(fontSize: 30),
                        ),
                      ),
                    ),

                    // Disegno il grafico
                    // Come parametro passo il modello del singolo grafico da disegnare
                    Flexible(
                      child: GraphDrawer(
                        modelloGrafico: widget.listaGrafici[index],
                      ),
                    )
                  ],
                ),
              ),

              // Descrizione
              Expanded(
                flex: 2,
                child: Container(),
              )
            ],
          ),
        );
      },
    );
  }
}
