class SentimentData {
  final int dayOfYear;
  final double compound;

  SentimentData({
    required this.dayOfYear,
    required this.compound,
  });

  factory SentimentData.fromJson(Map<String, dynamic> json) {
    return SentimentData(
      dayOfYear: 25,  // Temporary sample date (e.g., Jan 25). Change this manually to test.
      compound: json['VADER Sentiment Analysis']['compound'].toDouble(),
    );
  }
}
