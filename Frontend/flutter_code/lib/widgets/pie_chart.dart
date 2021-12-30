import 'package:flutter/material.dart';
import 'package:frontendscg/database/data_graph_builder.dart';
import 'package:frontendscg/utils/data_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// Widget per disegnare il grafico a torta degli scostamenti dentro la homepage

class PieChartDrawer extends StatefulWidget {
  const PieChartDrawer({Key? key}) : super(key: key);

  @override
  PieChartDrawerState createState() => PieChartDrawerState();
}

class PieChartDrawerState extends State<PieChartDrawer> {
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true, animationDuration: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dynamic data = DataGraphBuilder()
        .molPieChartData(Provider.of<DataProvider>(context).data);
    return SizedBox(
      height: 500,
      width: 1000,
      child: SfCircularChart(
        legend: Legend(
          isVisible: true,
          position: LegendPosition.left,
          offset: const Offset(20, 100),
        ),
        // Enables the tooltip for all the series in chart
        tooltipBehavior: _tooltip,
        series: <CircularSeries>[
          // Initialize line series
          PieSeries<PieChartData, String>(
            // Enables the tooltip for individual series
            enableTooltip: true,
            dataSource: data,
            xValueMapper: (PieChartData scost, _) => scost.nomeScostamento,
            yValueMapper: (PieChartData scost, _) => scost.valoreScostamento,
          )
        ],
      ),
    );
  }
}

// Data model for the pie chart
class PieChartData {
  PieChartData(this.nomeScostamento, this.valoreScostamento);
  final String nomeScostamento;
  final double valoreScostamento;
}
