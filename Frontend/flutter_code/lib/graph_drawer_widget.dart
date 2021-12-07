import 'package:flutter/material.dart';
import 'package:frontendscg/test.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphDrawer extends StatefulWidget {
  const GraphDrawer({Key? key}) : super(key: key);

  @override
  _GraphDrawerState createState() => _GraphDrawerState();
}

class _GraphDrawerState extends State<GraphDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Test().getlist(),
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
                  ]),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
