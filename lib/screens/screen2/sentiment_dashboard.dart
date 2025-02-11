import 'package:flutter/material.dart';
import 'package:untitled3/widgets/sentiment_line_chart.dart'; // Import the chart widget

class SentimentDashboard extends StatelessWidget {
  const SentimentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sentiment Dashboard")),
      body: Center( // Centering the entire widget
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Aligns in center of screen
          children: [
            Container(
              padding: const EdgeInsets.all(16.0), // Padding around chart
              decoration: BoxDecoration(
                color: Colors.greenAccent.withOpacity(1), // Light purple color
                borderRadius: BorderRadius.circular(15), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Shadow color
                    blurRadius: 3, // Blur effect
                    offset: const Offset(0, 4), // Position of shadow
                  ),
                ],
              ),
              child: const SentimentLineChart(), // The chart inside the container
            ),
            const SizedBox(height: 20), // Add some spacing
            const Text(
              "How's My Sentiment ?",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
