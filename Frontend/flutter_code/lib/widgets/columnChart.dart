import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontendscg/database/database.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// Widget per disegnare il grafico a colonne


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
    return Container(
      height: 500,
      width: 1000,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(minimum: 0, maximum: 40, interval: 10),
        tooltipBehavior: _tooltip,
        legend: Legend(isVisible: true),
        series: <ChartSeries<ColumnChartData, String>>[
          ColumnSeries<ColumnChartData, String>(
            dataSource: data,
            xValueMapper: (ColumnChartData data, _) => data.x,
            yValueMapper: (ColumnChartData data, _) => data.y,
            name: 'Budget',
            color: Color.fromRGBO(8, 142, 255, 1),
          ),
          ColumnSeries<ColumnChartData, String>(
            dataSource: data,
            xValueMapper: (ColumnChartData data, _) => data.x,
            yValueMapper: (ColumnChartData data, _) => data.y - 5,
            name: 'Consuntivo',
            color: Color.fromRGBO(100, 142, 255, 1),
          )
        ],
      ),
    );
  }
}

class ColumnChartData {
  ColumnChartData(this.x, this.y);

  final String x;
  final double y;
}
