import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontendscg/database/database.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// Widget per disegnare il grafico a colonne doppie presente nella home

class ColumnChartDrawer extends StatefulWidget {
  const ColumnChartDrawer({Key? key}) : super(key: key);

  @override
  ColumnChartDrawerState createState() => ColumnChartDrawerState();
}

class ColumnChartDrawerState extends State<ColumnChartDrawer> {
  late List<ColumnChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = Database().listaHomeColumnChart;
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: 1000,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            tooltipBehavior: _tooltip,
            legend: Legend(isVisible: true),
            series: <ChartSeries<ColumnChartData, String>>[
              // COLONNA DEL BUDGET
              ColumnSeries<ColumnChartData, String>(
                dataSource: data,
                xValueMapper: (ColumnChartData data, _) => data.x,
                yValueMapper: (ColumnChartData data, _) => data.budget,
                name: 'Budget',
                color: Color.fromRGBO(8, 142, 255, 1),
              ),

              // COLONNA DEL CONSUNTIVO
              ColumnSeries<ColumnChartData, String>(
                dataSource: data,
                xValueMapper: (ColumnChartData data, _) => data.x,
                yValueMapper: (ColumnChartData data, _) => data.consuntivo,
                name: 'Consuntivo',
                color: Color.fromRGBO(100, 142, 255, 1),
              )
            ],
          ),
        ],
      ),
    );
  }
}

// Data model for the column chart
// "x" is the name of the scostamento
class ColumnChartData {
  ColumnChartData(this.x, this.budget, this.consuntivo);
  final String x;
  final double budget;
  final double consuntivo;
}
