import 'package:flutter/material.dart';
import 'package:frontendscg/functions/fetch_datasets.dart';
import 'package:frontendscg/utils/modello_grafico.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

//  QUESTO WIDGET SERVE A DISEGNARE IL GRAFICO DEL SINGOLO DATASET PASSATO COME PARAMETRO

class GraphDrawer extends StatefulWidget {
  const GraphDrawer({Key? key, required this.modelloGrafico}) : super(key: key);

  // Nome del dataset usato poi per fare una richiesta all API
  final ModelloGrafico modelloGrafico;

  @override
  _GraphDrawerState createState() => _GraphDrawerState();
}

class _GraphDrawerState extends State<GraphDrawer> {
  String? datoFiltro;
  int? indexFiltro;
  late TextEditingController nomeController;
  late TextEditingController indexController;

  @override
  void initState() {
    nomeController = TextEditingController();
    indexController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // FILTRO VALORI
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text("Nome filtro: "),

            // TEXTFIELD NOME FILTRO
            Container(
              margin: const EdgeInsets.only(left: 20, right: 40),
              width: 150,
              child: TextField(
                controller: nomeController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 5),
                  isDense: true,
                ),
              ),
            ),
            const Text("Index filtro: "),

            // TEXTFIELD INDEX FILTRO
            Container(
              width: 150,
              margin: const EdgeInsets.only(left: 20, right: 40),
              child: TextField(
                controller: indexController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 5),
                  isDense: true,
                ),
              ),
            ),

            // LISTA NOMI DELLE COLONNE
            Flexible(child: FutureBuilder(
              future: FetchDatasets()
                  .getDatasetColumnNames(widget.modelloGrafico.nomeGrafico),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      const Text("Colonne disponibili: "),
                      Text(snapshot.data.toString())
                    ],
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),)
          ],
        ),

        // PULSANTE REFRESH
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                datoFiltro = nomeController.text;
                indexFiltro = int.tryParse(indexController.text);
              });
            },
            child: const Text("Refresh"),
          ),
        ),

        // GRAFICO
        FutureBuilder(
          future: FetchDatasets().fetchDatasets(
            nomeDataset: widget.modelloGrafico.nomeGrafico,
            xIndex: widget.modelloGrafico.indexX,
            yIndex1: widget.modelloGrafico.indexY1,
            yIndex2: widget.modelloGrafico.indexY2,
            yIndex3: widget.modelloGrafico.indexY3,
            indexNomeColonna: indexFiltro,
            nomeSingoloDato: datoFiltro,
          ),
          builder: (context, AsyncSnapshot<List<Data>>? snapshot) {
            if (snapshot!.hasData) {
              return Container(
                margin: const EdgeInsets.all(50),
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  // Chart title
                  title: ChartTitle(text: widget.modelloGrafico.nomeGrafico),

                  // Enable legend
                  legend: Legend(isVisible: true),

                  // Enable tooltip
                  series: <ChartSeries<Data, String>>[
                    // LINEA 1
                    LineSeries<Data, String>(
                      dataSource: snapshot.data!,
                      xValueMapper: (Data value, _) => value.xValues,
                      yValueMapper: (Data value, _) => value.yValues1,
                    ),

                    // LINEA 2
                    widget.modelloGrafico.indexY2 != null
                        ? LineSeries<Data, String>(
                            dataSource: snapshot.data!,
                            xValueMapper: (Data value, _) => value.xValues,
                            yValueMapper: (Data value, _) => value.yValues2,
                          )
                        : LineSeries(
                            dataSource: [],
                            xValueMapper: (_, __) {},
                            yValueMapper: (_, __) {},
                          ),

                    // LINEA 3
                    widget.modelloGrafico.indexY3 != null
                        ? LineSeries<Data, String>(
                            dataSource: snapshot.data!,
                            xValueMapper: (Data value, _) => value.xValues,
                            yValueMapper: (Data value, _) => value.yValues3,
                          )
                        : LineSeries(
                            dataSource: [],
                            xValueMapper: (_, __) {},
                            yValueMapper: (_, __) {},
                          ),
                  ],
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        )
      ],
    );
  }
}





/* import 'package:flutter/material.dart';
import 'package:frontendscg/functions/fetch_datasets.dart';
import 'package:frontendscg/utils/modello_grafico.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

//  QUESTO WIDGET SERVE A DISEGNARE IL GRAFICO DEL SINGOLO DATASET PASSATO COME PARAMETRO

class GraphDrawer extends StatefulWidget {
  const GraphDrawer({Key? key, required this.modelloGrafico}) : super(key: key);

  // Nome del dataset usato poi per fare una richiesta all API
  final ModelloGrafico modelloGrafico;

  @override
  _GraphDrawerState createState() => _GraphDrawerState();
}

class _GraphDrawerState extends State<GraphDrawer> {
  String? datoFiltro;
  int? indexFiltro;
  late TextEditingController nomeController;
  late TextEditingController indexController;

  @override
  void initState() {
    nomeController = TextEditingController();
    indexController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FetchDatasets().fetchDatasets(
        nomeDataset: widget.modelloGrafico.nomeGrafico,
        xIndex: widget.modelloGrafico.indexX,
        yIndex1: widget.modelloGrafico.indexY1,
        yIndex2: widget.modelloGrafico.indexY2,
        yIndex3: widget.modelloGrafico.indexY3,
        
        indexNomeColonna: indexFiltro,
        nomeSingoloDato: datoFiltro,
      ),
      builder: (context, AsyncSnapshot<List<Data>>? snapshot) {
        if (snapshot!.hasData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // FILTRO VALORI
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text("Nome filtro: "),

                  // TEXTFIELD NOME FILTRO
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 40),
                    width: 150,
                    child: TextField(
                      controller: nomeController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 5),
                        isDense: true,
                      ),
                    ),
                  ),
                  const Text("Index filtro: "),

                  // TEXTFIELD INDEX FILTRO
                  Container(
                    width: 150,
                    margin: const EdgeInsets.only(left: 20, right: 40),
                    child: TextField(
                      controller: indexController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 5),
                        isDense: true,
                      ),
                    ),
                  ),

                  // LISTA NOMI DELLE COLONNE
                  FutureBuilder(
                    future: FetchDatasets().getDatasetColumnNames(
                        widget.modelloGrafico.nomeGrafico),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: [
                            const Text("Colonne disponibili: "),
                            Text(snapshot.data.toString())
                          ],
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                ],
              ),

              // PULSANTE REFRESH
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      datoFiltro = nomeController.text;
                      indexFiltro = int.tryParse(indexController.text);
                    });
                  },
                  child: const Text("Refresh"),
                ),
              ),

              // GRAFICO
              Container(
                margin: const EdgeInsets.all(50),
                child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  // Chart title
                  title: ChartTitle(text: widget.modelloGrafico.nomeGrafico),

                  // Enable legend
                  legend: Legend(isVisible: true),

                  // Enable tooltip
                  series: <ChartSeries<Data, String>>[
                    // LINEA 1
                    LineSeries<Data, String>(
                      dataSource: snapshot.data!,
                      xValueMapper: (Data value, _) => value.xValues,
                      yValueMapper: (Data value, _) => value.yValues1,
                    ),

                    // LINEA 2
                    widget.modelloGrafico.indexY2 != null
                        ? LineSeries<Data, String>(
                            dataSource: snapshot.data!,
                            xValueMapper: (Data value, _) => value.xValues,
                            yValueMapper: (Data value, _) => value.yValues2,
                          )
                        : LineSeries(
                            dataSource: [],
                            xValueMapper: (_, __) {},
                            yValueMapper: (_, __) {},
                          ),

                     // LINEA 3
                    widget.modelloGrafico.indexY3 != null
                        ? LineSeries<Data, String>(
                            dataSource: snapshot.data!,
                            xValueMapper: (Data value, _) => value.xValues,
                            yValueMapper: (Data value, _) => value.yValues3,
                          )
                        : LineSeries(
                            dataSource: [],
                            xValueMapper: (_, __) {},
                            yValueMapper: (_, __) {},
                          ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
 */