class Recommendation {
  final String songId;
  final double confidenceScore;
  final String reason;
  final DateTime generatedAt;

  Recommendation({
    required this.songId,
    required this.confidenceScore,
    required this.reason,
    required this.generatedAt,
  });

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
      songId: json['songId'],
      confidenceScore: json['confidenceScore'].toDouble(),
      reason: json['reason'] ?? 'Based on your listening history',
      generatedAt: DateTime.parse(json['generatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'songId': songId,
      'confidenceScore': confidenceScore,
      'reason': reason,
      'generatedAt': generatedAt.toIso8601String(),
    };
  }
}