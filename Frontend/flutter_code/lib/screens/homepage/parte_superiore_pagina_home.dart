import 'package:flutter/material.dart';
import 'package:frontendscg/functions/upload_dataset.dart';
import 'package:frontendscg/utils/data_provider.dart';
import 'package:provider/provider.dart';

// Parte superiore della pagina home. Qui sono contenuti il titolo e il pulsante back

class ParteSuperiorePaginaHome extends StatefulWidget {
  const ParteSuperiorePaginaHome({Key? key}) : super(key: key);

  @override
  State<ParteSuperiorePaginaHome> createState() =>
      _ParteSuperiorePaginaHomeState();
}

class _ParteSuperiorePaginaHomeState extends State<ParteSuperiorePaginaHome> {
  // Variabile che indica se al momento è in corso il caricamento/elaborazione di un dataset
  late bool isDataLoading;

  @override
  void initState() {
    isDataLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 20, left: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green[400],
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          margin: const EdgeInsets.only(right: 20),
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // TITOLO
              Expanded(
                flex: 12,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 500,
                  child: const FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Text("Margine Operativo Lordo"),
                  ),
                ),
              ),

              // PULSANTE UPLOAD DATASET
              Expanded(
                flex: 2,
                child: Container(
                  height: 70,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.green[700]),
                    onPressed: () async {
                      setState(() {
                        isDataLoading = true;
                      });
                      // Funzione per il caricamento del dataset
                      if (await UploadDataset().upload(context) == true) {
                        // se il dataset viene caricato, eseguo l'elaborazione del dataset
                        await Provider.of<DataProvider>(context, listen: false)
                            .init();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                "Dataset caricato ed elaborato correttamente"),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Errore durante caricamento dataset"),
                          ),
                        );
                      }
                      setState(() {
                        isDataLoading = false;
                      });
                    },
                    child: isDataLoading
                        ? const CircularProgressIndicator()
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const <Widget>[
                              Expanded(
                                flex: 3,
                                child: Text(
                                  "Upload a new dataset",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Icon(Icons.upload),
                              )
                            ],
                          ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
