import 'package:flutter/material.dart';
import 'package:frontendscg/database/database.dart';
import 'package:frontendscg/functions/upload_dataset.dart';
import 'package:frontendscg/widgets/columnChart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double _scostamentoTotaleMol;
  late double _molBudget;
  late double _molConsuntivo;

  @override
  void initState() {
    _scostamentoTotaleMol = Database().scostamentoTotaleMol;
    _molBudget = Database().budgetMol;
    _molConsuntivo = Database().consuntivoMol;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            Container(
              margin: EdgeInsets.only(top: 50, bottom: 50, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // TITOLO
                  Container(
                    child: const Text(
                      "Scostamento Totale (MOL):    ",
                      style: TextStyle(fontSize: 50),
                    ),
                  ),

                  // NUMERO TITOLO
                  Container(
                    child: Text(
                      "€ $_scostamentoTotaleMol",
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // TITOLI BUDGET CONSUNTIVO 
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: const <Widget>[
                             Text(
                              "Margine Operativo Lordo Budget:",
                              style: TextStyle(fontSize: 30),
                            ),
                             Text(
                              "Margine Operativo Lordo Consuntivo:",
                              style: TextStyle(fontSize: 30),
                            ),
                          ],
                        ),

                        // VALORI NUMERI BUDGET/CONSUNTIVO
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            
                            Padding(
                              padding: const EdgeInsets.only(right: 100),
                              child: Text(
                                "€ $_molBudget",
                                style: const TextStyle(fontSize: 30),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 100),
                              child: Text(
                                "€ $_molConsuntivo",
                                style: const TextStyle(fontSize: 30),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // COLUMN CHART
                const ColumnChartDrawer()
              ],
            ),
          ],
        ),
      ),
    );
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