import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled3/screens/screen2/sentiment_dashboard.dart'; // Ensure this path is correct

import 'core/constants/app_colors.dart';

void main() {
  runApp(const SentimentApp());
}

class SentimentApp extends StatelessWidget {
  const SentimentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sentiment Dashboard",
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const SentimentDashboard(), // Ensure SentimentDashboard is defined in the imported file
    );
  }
}
