import 'package:flutter/material.dart';
import 'package:frontendscg/database/database.dart';
import 'package:frontendscg/functions/upload_dataset.dart';
import 'package:frontendscg/widgets/graph_list_widget.dart';

// TODO: mettere schermatra di caricamento finchè tutti i grafici presenti nella pagina da visualizzare sono pronti

void main() async {
  runApp(const MyApp());
}

// Use this command to run the app on chrome
// flutter run -d chrome --web-renderer html

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SCGProject',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Progetto SCG"),
        centerTitle: true,
        actions: [
          // Pulsante per upload del dataset
          IconButton(
            onPressed: () async {
              // Avvio processo di upload dataset
              bool result = await UploadDataset().upload();

              // Mostro esito dell'operazione di upload
              if (result) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Caricamento Riuscito"),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Caricamento Non Riuscito"),
                  ),
                );
              }
            },
            icon: const Icon(Icons.upload),
          )
        ],
      ),

      // Lista dei raw datasets
      body: GraphList(
        listaGrafici: Database().rawGraphsList,
      ),
    );
  }
}
