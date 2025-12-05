// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:music_recommendation_app/models/recommendation_model.dart';

// class MLRecommendationService {
//   // For production, use actual ML API endpoint
//   static const String _apiUrl = 'http://localhost:5000/api/recommend';

//   // Simulated ML recommendation service
//   Future<List<Recommendation>> getRecommendations({
//     String? userId,
//     int limit = 10,
//   }) async {
//     // In real implementation, call ML API
//     // final response = await http.post(
//     //   Uri.parse(_apiUrl),
//     //   headers: {'Content-Type': 'application/json'},
//     //   body: jsonEncode({'userId': userId, 'limit': limit}),
//     // );

//     // Simulate API delay
//     await Future.delayed(const Duration(seconds: 2));

//     // Mock recommendations for demo
//     return List.generate(5, (index) {
//       return Recommendation(
//         songId: 'song_${index + 1}',
//         confidenceScore: 0.9 - (index * 0.1),
//         reason: _getMockReason(index),
//         generatedAt: DateTime.now(),
//       );
//     });
//   }

//   String _getMockReason(int index) {
//     final reasons = [
//       'Based on your recent plays of similar artists',
//       'High match with your favorite genre: Pop',
//       'Trending among users with similar taste',
//       'Matches your listening mood (energetic)',
//       'New release from artists you follow',
//     ];
//     return reasons[index % reasons.length];
//   }

//   // Content-based filtering
//   Future<List<String>> getContentBasedRecommendations(
//     List<String> favoriteGenres,
//     List<String> listenedSongs, {
//     int limit = 5,
//   }) async {
//     // Implement content-based filtering logic
//     // This would typically call a Python ML service
//     return [
//       'song_1',
//       'song_2',
//       'song_3',
//       'song_4',
//       'song_5',
//     ];
//   }

//   // Collaborative filtering
//   Future<List<String>> getCollaborativeRecommendations(
//     String userId,
//     Map<String, int> userRatings, {
//     int limit = 5,
//   }) async {
//     // Implement collaborative filtering logic
//     // Find similar users and recommend songs they liked
//     return [
//       'song_6',
//       'song_7',
//       'song_8',
//       'song_9',
//       'song_10',
//     ];
//   }

//   // Hybrid recommendation (combines both methods)
//   Future<List<Recommendation>> getHybridRecommendations(
//     String userId,
//     List<String> favoriteGenres,
//     List<String> listeningHistory,
//     Map<String, int> ratings,
//   ) async {
//     // Combine content-based and collaborative filtering
//     final contentBased =
//         await getContentBasedRecommendations(favoriteGenres, listeningHistory);
//     final collaborative = await getCollaborativeRecommendations(userId, ratings);

//     // Merge and deduplicate
//     final allIds = {...contentBased, ...collaborative}.toList();

//     return allIds
//         .map((id) => Recommendation(
//               songId: id,
//               confidenceScore: 0.85,
//               reason: 'Hybrid recommendation based on your profile',
//               generatedAt: DateTime.now(),
//             ))
//         .toList();
//   }
// }