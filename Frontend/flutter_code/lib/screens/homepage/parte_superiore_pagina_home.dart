import 'package:flutter/material.dart';
import 'package:frontendscg/functions/upload_dataset.dart';

// Parte superiore della pagina home. Qui sono contenuti il titolo e il pulsante back

class ParteSuperiorePaginaHome extends StatelessWidget {
  const ParteSuperiorePaginaHome({Key? key}) : super(key: key);

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
                      // Snackbars
                      if (await UploadDataset().upload() == true) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Dataset caricato correttamente"),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Errore durante caricamento dataset"),
                          ),
                        );
                      }
                    },
                    child: Row(
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
