import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class YearSummaryChart extends StatelessWidget {
  final List<FlSpot> monthSpots;

  const YearSummaryChart(this.monthSpots, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        axisTitleData: FlAxisTitleData(
          show: true,
          leftTitle: AxisTitle(
            showTitle: true,
            titleText: "Orders",
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.grey[400],
              strokeWidth: 1,
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: Colors.grey[400],
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: SideTitles(showTitles: false),
          topTitles: SideTitles(showTitles: false),
          bottomTitles: SideTitles(
              // rotateAngle: 60,
              showTitles: true,
              reservedSize: 22,
              interval: 1,
              getTextStyles: (context, value) => const TextStyle(
                  color: Color(0xff68737d),
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
              margin: 8,
              getTitles: (value) {
                switch (value.toInt()) {
                  case 2:
                    return "Feb";
                  case 5:
                    return "May";
                  case 8:
                    return "Aug";
                  case 11:
                    return "Nov";
                }
                return '';
              }),
          leftTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTextStyles: (context, value) => const TextStyle(
              color: Color(0xff67727d),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            reservedSize: 32,
            margin: 12,
          ),
        ),
        borderData: FlBorderData(
            show: true,
            border: Border.all(color: const Color(0xff37434d), width: 1)),
        minX: 1,
        maxX: 12,
        minY: 0,
        maxY: 15,
        lineBarsData: [
          LineChartBarData(
            spots: monthSpots,
            isCurved: false,
            colors: [
              Colors.blue[600]!,
            ],
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
            ),
            belowBarData: BarAreaData(
              show: false,
            ),
          ),
        ],
      ),
    );
  }
}
