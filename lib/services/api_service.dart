import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/sentiment_data.dart';

class ApiService {
  Future<SentimentData> fetchSentimentData() async {
    final response = await http.get(Uri.parse('http://localhost:5000/sentiment/analyze'));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      return SentimentData.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load sentiment data');
    }
  }
}
