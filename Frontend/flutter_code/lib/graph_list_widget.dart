import 'package:flutter/material.dart';
import 'package:frontendscg/utils/graph_names.dart';

// TODO: evitare di fare una request alla api per ogni volta che lo schermo esegue un refresh. Meglio farlo una volta sola.

class GraphListWidget extends StatefulWidget {
  const GraphListWidget({ Key? key }) : super(key: key);

  // Numero dei grafici da rappresentare nella lista
  final int numeroGrafici = 7;

  // Url base del nostro server
  //final String prefixUrl = "https://192.168.1.113:80";
  final String prefixUrl = "https://localhost:80";

  // Formato delle immagini mostrate
  final String imageExtension = ".jpeg";  

  @override
  _GraphListWidgetState createState() => _GraphListWidgetState();
}

class _GraphListWidgetState extends State<GraphListWidget> {  
  late List<String> listaGrafici; 

  @override
  void initState() {
    listaGrafici = GraphNames().graphList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
       itemCount: widget.numeroGrafici,
       itemBuilder: (context, index){
       return Container(
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(10), 
           color: Colors.blue[200]
         ),
         margin: const EdgeInsets.all(25),
         padding: const EdgeInsets.all(25),
         child: Row(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
              Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [ 
            // Titolo Immagine
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child:  Text(listaGrafici[index],
                style: const TextStyle(
                fontSize: 30
                ),
              ),
            ),           

            // Creo url per l'api da cui vado a pescare l'immagine
            //Image.network("${widget.prefixUrl}/get-graph-image/${listaGrafici[index]}${widget.imageExtension}")
            //https://cors-anywhere.herokuapp.com/
            Image.network("${widget.prefixUrl}/get-graph-image/${listaGrafici[index]}${widget.imageExtension}")
          ],
         ),

         // Descrizione
         Container(
           margin: const EdgeInsets.only(left: 30, top: 50),
           child: const Text("Descrizione:",
                    style:  TextStyle(
                      fontSize: 20
                    ),
                  ),
         )
           ],
         )
       );
     });    
  }
}