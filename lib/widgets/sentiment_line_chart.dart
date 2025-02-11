import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SentimentLineChart extends StatelessWidget {
  const SentimentLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25, // 25% of screen height (approx 2 rows)
      width: MediaQuery.of(context).size.width * 0.9, // 90% of screen width (4 columns)

      child: LineChart(
        LineChartData(
          gridData: FlGridData(  // edits on grids
            show: true,
            drawVerticalLine: true,
            horizontalInterval: 1,
            verticalInterval: 10,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey.withOpacity(0.3),
                strokeWidth: 10, // width of line
              );
            },
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: Colors.grey.withOpacity(0.3),
                strokeWidth: 1,
              );
            },
          ),
          titlesData: FlTitlesData(
            show: true,  //data tiles
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 20,
                interval: 10,
                getTitlesWidget: (value, meta) {
                  Map<int, String> labels = {
    0: 'Jan',
    30: 'Feb',
    60: 'Mar',
    90: 'Apr',
    120: 'May',
    150: 'Jun',
    180: 'Jul',
    210: 'Aug',
    240: 'Sep',
    270: 'Oct',
    300: 'Nov',
    330: 'Dec'
    };
                  return Text(labels[value.toInt()] ?? '', style: const TextStyle(color: Colors.white, fontSize: 12));
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  );
                },
                reservedSize: 30,
              ),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
          ),
          minX: 0,
          maxX: 330, //ange x axis and put 120 for 12 months and 10 each
          minY: -1,
          maxY: 1,
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(0, 0), //we can match these for each days
                FlSpot(13, 0.3),
                FlSpot(20, 0.3),
                FlSpot(30, 0.5),
                FlSpot(40, 0.6),
                FlSpot(55, 0.9),
                FlSpot(70, -1),
                FlSpot(80, 0.8),
                FlSpot(230, 0.8),
              ],
              isCurved: true,
              color: Colors.blue,
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) {
                  return FlDotCirclePainter(
                    radius: 2,
                    color: Colors.black,
                    strokeWidth: 1,
                    strokeColor: Colors.white,
                  );
                },
              ),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [Colors.blue.withOpacity(0.4), Colors.blue.withOpacity(0.1)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
