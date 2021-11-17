import 'package:flutter/material.dart';
import 'package:frontendscg/utils/graph_names.dart';


class GraphListWidget extends StatefulWidget {
  const GraphListWidget({ Key? key }) : super(key: key);

  // Numero dei grafici da rappresentare nella lista
  final int numeroGrafici = 7;

  // Url base del nostro server
  final String prefixUrl = "http://127.0.0.1:5000";

  @override
  _GraphListWidgetState createState() => _GraphListWidgetState();
}

class _GraphListWidgetState extends State<GraphListWidget> {  
  late List<String> listaGrafici; 
  final String imageExtension = ".jpeg";

  @override
  void initState() {
    listaGrafici = GraphNames().graphList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
     child: ListView.builder(
       itemCount: widget.numeroGrafici,
       itemBuilder: (context, index){
       return Container(
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(10), 
           color: Colors.blue[200]
         ),
         margin: EdgeInsets.all(25),
         padding: EdgeInsets.all(25),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [ 
            // Titolo Immagine
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child:  Text(listaGrafici[index], style: const TextStyle(
                fontSize: 30
              ),
              ),
            ),           

            // Creo url per l'api da cui vado a pescare l'immagine
            Image.network("${widget.prefixUrl}/get-graph-image/${listaGrafici[index]}$imageExtension")
          ],
         ),
       );
     }), 
    );
  }
}