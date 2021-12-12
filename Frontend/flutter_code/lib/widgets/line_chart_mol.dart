import 'package:flutter/material.dart';
import 'package:frontendscg/functions/fetch_datasets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// QUESTO WIDGET SERVE A DISEGNARE IL GRAFICO A SINGOLA RIGA PER LO SCOSTAMENTO DEL MOL

class LineChartMol extends StatelessWidget {
  const LineChartMol({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FetchDatasets().fetchDatasets(
        nomeDataset: "scostamentoConsumiArt",
        xIndex: 100,
        yIndex1: 4,
      ),
      builder: (context, AsyncSnapshot<List<Data>>? snapshot) {
        if (snapshot!.hasData) {
          return Container(
            //margin: const EdgeInsets.all(20),
            child: SfCartesianChart(
              zoomPanBehavior: ZoomPanBehavior(enableSelectionZooming: true),
              primaryXAxis: CategoryAxis(),
              // Chart title
              title: ChartTitle(text: "Scostamento M.O.L."),

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
