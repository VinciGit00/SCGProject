import 'package:flutter/material.dart';
import 'package:frontendscg/functions/upload_dataset.dart';
import 'package:frontendscg/screens/pagina_scostamenti_costi.dart';
import 'package:frontendscg/widgets/columnChart.dart';
import 'package:frontendscg/widgets/pulsante_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text("DASHBOARD"),
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
      body: Column(
        children: [
          ColumnChartDrawer()
        ],
      ),
    ),);
  }
}


/* Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue[200],
      ),
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const <Widget>[
          // PAGINA SCOSTAMENTI COSTI
          PulsanteHomePage(
            route: PaginaScostamentiCosti(title: "SCOSTAMENTI COSTI"),
            title: "Scostamenti Costi",
          ),

          // PAGINA SCOSTAMENTI VENDITE
          PulsanteHomePage(
            route: PaginaScostamentiCosti(title: "Scostamenti Vendite",),
            title: "Scostamenti Vendite",
          ),

          // PAGINA GRAFICI
          PulsanteHomePage(
            route: PaginaScostamentiCosti(title: "",),
            title: "Grafici",
          ),
        ],
      ),
    );
  } */