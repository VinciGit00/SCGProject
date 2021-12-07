import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:frontendscg/functions/fetch_datasets.dart';
import 'package:frontendscg/utils/graph_names.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

//  QUESTO WIDGET SERVE A DISEGNARE IL GRAFICO DEL SINGOLO DATASET PASSATO COME PARAMETRO

class GraphDrawer extends StatefulWidget {
  const GraphDrawer({Key? key, required this.nomeDataset}) : super(key: key);

  final String nomeDataset;

  @override
  _GraphDrawerState createState() => _GraphDrawerState();
}

class _GraphDrawerState extends State<GraphDrawer> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FetchDatasets().fetchDatasets(nomeDataset: widget.nomeDataset),
      builder: (context, AsyncSnapshot<List<Data>>? snapshot) {
        if (snapshot!.hasData) {
          return Container(
            margin: EdgeInsets.all(50),
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              // Chart title
              title: ChartTitle(text: 'Half yearly sales analysis'),

              // Enable legend
              legend: Legend(isVisible: true),

              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<Data, String>>[
                LineSeries<Data, String>(
                  dataSource: snapshot.data!,
                  xValueMapper: (Data sales, _) => sales.time,
                  yValueMapper: (Data sales, _) => sales.value,
                )
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
