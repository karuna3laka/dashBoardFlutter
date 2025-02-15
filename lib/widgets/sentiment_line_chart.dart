import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/sentiment_data.dart';
import '../services/api_service.dart';

class SentimentLineChart extends StatefulWidget {
  const SentimentLineChart({super.key});

  @override
  _SentimentLineChartState createState() => _SentimentLineChartState();
}

class _SentimentLineChartState extends State<SentimentLineChart> {
  List<SentimentData> chartData = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      ApiService apiService = ApiService();
      SentimentData data = await apiService.fetchSentimentData();

      // For now, add the fetched data with a sample date
      setState(() {
        chartData = [
          SentimentData(dayOfYear: 25, compound: data.compound),   // Jan 25
          SentimentData(dayOfYear: 46, compound: 0.2),             // Feb 15
          SentimentData(dayOfYear: 64, compound: 0.1),             // Mar 5
          SentimentData(dayOfYear: 120, compound: 0.5),            // Apr 30
          SentimentData(dayOfYear: 180, compound: -0.3),           // Jun 29
          SentimentData(dayOfYear: 240, compound: 0.8),            // Aug 28
          SentimentData(dayOfYear: 300, compound: -0.4),           // Oct 27
          SentimentData(dayOfYear: 330, compound: 0.6),            // Dec 30
        ];
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    List<FlSpot> spots = chartData.map((e) {
      return FlSpot(e.dayOfYear.toDouble(), e.compound);
    }).toList();

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.9,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            horizontalInterval: 1,
            verticalInterval: 10,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey.withOpacity(0.3),
                strokeWidth: 10,
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
            show: true,
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 20,
                interval: 30,
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
                  return Text(
                    labels[value.toInt()] ?? '',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  );
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
          maxX: 330,
          minY: -1,
          maxY: 1,
          lineBarsData: [
            LineChartBarData(
              spots: spots,
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
