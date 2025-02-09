import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MoodGraph extends StatelessWidget {
  final List<FlSpot> moodData;

  MoodGraph({required this.moodData});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: true),
        titlesData: FlTitlesData(show: true),
        borderData: FlBorderData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots: moodData,
            isCurved: true,
            colors: [Colors.blue],
            barWidth: 4,
            belowBarData:
                BarAreaData(show: true, colors: [Colors.blue.withOpacity(0.3)]),
          ),
        ],
      ),
    );
  }
}
