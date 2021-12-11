import 'package:flutter/material.dart';
import 'package:frontendscg/database/database.dart';
import 'package:frontendscg/functions/upload_dataset.dart';
import 'package:frontendscg/widgets/column_chart.dart';
import 'package:frontendscg/widgets/pie_chart.dart';
import 'package:frontendscg/widgets/pulsante_altri_scostamenti.dart';

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
        backgroundColor: Colors.green[200],
        appBar: AppBar(
          backgroundColor: Colors.green,
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
              margin: const EdgeInsets.only(top: 30, bottom: 20, left: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green[400],
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                margin: EdgeInsets.only(right: 20),
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    // TITOLO
                    Container(
                      child: const Text(
                        "Scostamento Margine Operativo Lordo:    ",
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
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green[400],
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      margin: const EdgeInsets.only(right: 20),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          // RIGA CON TESTO BUDGET/CONSUNTIVO
                          Flexible(
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
                                      padding:
                                          const EdgeInsets.only(right: 100),
                                      child: Text(
                                        "€ $_molBudget",
                                        style: const TextStyle(fontSize: 30),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 100),
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

                          // RIGA CON PULSANTI BUDGET/CONSUNTIVO
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                // PULSANTE BUDGET + CONSUNTIVO
                                Container(
                                  margin: EdgeInsets.only(top: 30, right: 20),
                                  height: 100,
                                  width: 200,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.green),
                                    onPressed: () {},
                                    child: const Text("Budget + Consuntivo"),
                                  ),
                                ),

                                // PULSANTE SCOSTAMENTO
                                Container(
                                  margin: EdgeInsets.only(top: 30, right: 20),
                                  height: 100,
                                  width: 200,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.green),
                                    onPressed: () {},
                                    child: const Text("Scostamento"),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // PIE CHART
                          const Flexible(
                            child: PieChartDrawer(),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green[400],
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    margin: EdgeInsets.only(right: 20),
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 27),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // COLUMN CHART
                        const ColumnChartDrawer(),

                        // PULSANTI PER GLI ALTRI SCOSTAMENTI
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: const Text(
                            "Altri Scostamenti: ",
                            style: TextStyle(fontSize: 40),
                          ),
                        ),

                        PulsanteAltriScostamenti(
                          nomeScostamento: "Ricavi",
                          valoreScostamento: Database().scostamentoRicavi,
                        ),

                        PulsanteAltriScostamenti(
                          nomeScostamento: "Materie Prime",
                          valoreScostamento: Database().scostamentoMateriePrime,
                        ),

                        PulsanteAltriScostamenti(
                          nomeScostamento: "Lavorazioni Interne",
                          valoreScostamento:
                              Database().scostamentoLavorazioniInterne,
                        ),

                        PulsanteAltriScostamenti(
                          nomeScostamento: "Costi Totali",
                          valoreScostamento: Database().scostamentoCostiTotali,
                        ),

                        PulsanteAltriScostamenti(
                          nomeScostamento: "Margine Op. Lordo",
                          valoreScostamento: Database().scostamentoTotaleMol,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
