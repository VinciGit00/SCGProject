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
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FetchDatasets().fetchDatasets(
        nomeDataset: widget.modelloGrafico.nomeGrafico,
        xIndex: widget.modelloGrafico.indexX,
        yIndex: widget.modelloGrafico.indexY,
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
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<Data, String>>[
                LineSeries<Data, String>(
                  dataSource: snapshot.data!,
                  xValueMapper: (Data value, _) => value.xValues,
                  yValueMapper: (Data value, _) => value.yValues,
                )
              ],
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
