import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontendscg/database/database.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// Widget per disegnare il grafico a torta degli scostamenti dentro la homepage

class PieChartDrawer extends StatefulWidget {
  const PieChartDrawer({Key? key}) : super(key: key);

  @override
  PieChartDrawerState createState() => PieChartDrawerState();
}

class PieChartDrawerState extends State<PieChartDrawer> {
  late List<PieChartData> _data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    //_data = Database().listaHomePieChart;
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  Future<List<PieChartData>> getPieData() async {
    return Database().listaHomePieChart;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PieChartData>>(
      future: getPieData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            height: 500,
            width: 1000,
            child: SfCircularChart(
              legend: Legend(
                  isVisible: true,
                  position: LegendPosition.left,
                  offset: const Offset(20, 150)),
              // Enables the tooltip for all the series in chart
              tooltipBehavior: _tooltip,
              series: <CircularSeries>[
                // Initialize line series
                PieSeries<PieChartData, String>(
                    // Enables the tooltip for individual series
                    enableTooltip: true,
                    dataSource: snapshot.data,
                    xValueMapper: (PieChartData scost, _) =>
                        scost.nomeScostamento,
                    yValueMapper: (PieChartData scost, _) =>
                        scost.valoreScostamento)
              ],
            ),
          );
        } else {
          return const Center(
            child: SizedBox(
              height: 150,
              width: 150,
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

// Data model for the pie chart
class PieChartData {
  PieChartData(this.nomeScostamento, this.valoreScostamento);
  final String nomeScostamento;
  final double valoreScostamento;
}
