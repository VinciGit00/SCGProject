import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// WIDGET PER DISEGNARE I GRAFICI A SINGOLA/DOPPIA COLONNA

class ColumnChartDrawer extends StatefulWidget {
  const ColumnChartDrawer({
    Key? key,
    required this.title,
    this.secondaColonna = false,
    required this.nomePrimaColonna,
    this.nomeSecondaColonna = "",
    required this.data,
  }) : super(key: key);

  final String title;
  final bool secondaColonna;
  final String nomePrimaColonna;
  final String nomeSecondaColonna;
  final dynamic data;

  @override
  ColumnChartDrawerState createState() => ColumnChartDrawerState();
}

class ColumnChartDrawerState extends State<ColumnChartDrawer> {
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ColumnChartData>>(
      future: widget.data,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            width: 1000,
            child: widget.secondaColonna
                ?
                // GRAFICO A DOPPIA COLONNA
                SfCartesianChart(
                    title: ChartTitle(text: widget.title),
                    margin: EdgeInsets.zero,
                    primaryXAxis: CategoryAxis(),
                    tooltipBehavior: _tooltip,
                    legend: Legend(isVisible: true),
                    series: <ChartSeries<ColumnChartData, String>>[
                      // PRIMA COLONNA / COLONNA BUDGET
                      ColumnSeries<ColumnChartData, String>(
                        dataSource: snapshot.data!,
                        xValueMapper: (ColumnChartData data, _) => data.x,
                        yValueMapper: (ColumnChartData data, _) =>
                            data.colonna1,
                        name: widget.nomePrimaColonna,
                        color: const Color.fromRGBO(8, 142, 255, 1),
                      ),

                      // SECONDA COLONNA / COLONNA CONSUNTIVO
                      ColumnSeries<ColumnChartData, String>(
                        dataSource: snapshot.data!,
                        xValueMapper: (ColumnChartData data, _) => data.x,
                        yValueMapper: (ColumnChartData data, _) =>
                            data.colonna2,
                        name: widget.nomeSecondaColonna,
                        color: const Color.fromRGBO(100, 142, 255, 1),
                      )
                    ],
                  )

                // GRAFICO A SINGOLA COLONNA
                : SfCartesianChart(
                    title: ChartTitle(text: widget.title),
                    margin: EdgeInsets.zero,
                    primaryXAxis: CategoryAxis(),
                    tooltipBehavior: _tooltip,
                    legend: Legend(isVisible: true),
                    series: <ChartSeries<ColumnChartData, String>>[
                      ColumnSeries<ColumnChartData, String>(
                        dataSource: snapshot.data!,
                        xValueMapper: (ColumnChartData data, _) => data.x,
                        yValueMapper: (ColumnChartData data, _) =>
                            data.colonna1,
                        name: widget.nomePrimaColonna,
                        color: const Color.fromRGBO(8, 142, 255, 1),
                      ),
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

// Data model for the column chart
// Colonna 1 = Budget, Colonna 2 = Consuntivo
// "x" is the name of the scostamento
class ColumnChartData {
  ColumnChartData({required this.x, required this.colonna1, this.colonna2});
  final String x;
  final double colonna1;
  final double? colonna2;
}
