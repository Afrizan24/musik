// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:music_recommendation_app/models/song_model.dart';
// import 'package:music_recommendation_app/models/recommendation_model.dart';
// import 'package:music_recommendation_app/services/ml_recommendation_service.dart';
// import 'package:music_recommendation_app/widgets/recommendation_card.dart';
// import 'package:music_recommendation_app/screens/player_screen.dart';

// class RecommendationsScreen extends StatefulWidget {
//   const RecommendationsScreen({super.key});

//   @override
//   State<RecommendationsScreen> createState() => _RecommendationsScreenState();
// }

// class _RecommendationsScreenState extends State<RecommendationsScreen> {
//   List<Song> _recommendedSongs = [];
//   bool _isLoading = true;
//   String _selectedFilter = 'all';

//   @override
//   void initState() {
//     super.initState();
//     _loadRecommendations();
//   }

//   Future<void> _loadRecommendations() async {
//     final mlService = MLRecommendationService();
//     final recommendations = await mlService.getRecommendations();
    
//     // In real app, fetch actual songs based on recommendations
//     setState(() {
//       _recommendedSongs = _getMockSongs();
//       _isLoading = false;
//     });
//   }

//   List<Song> _getMockSongs() {
//     return [
//       Song(
//         id: '1',
//         title: 'Blinding Lights',
//         artist: 'The Weeknd',
//         album: 'After Hours',
//         genre: 'Synth-pop',
//         duration: 200,
//         releaseDate: DateTime(2020, 3, 20),
//         tempo: 171,
//         energy: 0.8,
//         danceability: 0.9,
//         tags: ['popular', 'dance', 'chart'],
//       ),
//       Song(
//         id: '2',
//         title: 'Stay',
//         artist: 'The Kid LAROI, Justin Bieber',
//         album: 'F*CK LOVE 3',
//         genre: 'Pop',
//         duration: 141,
//         releaseDate: DateTime(2021, 7, 9),
//         tempo: 140,
//         energy: 0.7,
//         danceability: 0.8,
//         tags: ['viral', 'tiktok'],
//       ),
//       Song(
//         id: '3',
//         title: 'good 4 u',
//         artist: 'Olivia Rodrigo',
//         album: 'SOUR',
//         genre: 'Pop Rock',
//         duration: 178,
//         releaseDate: DateTime(2021, 5, 14),
//         tempo: 166,
//         energy: 0.85,
//         danceability: 0.75,
//         tags: ['angry', 'breakup'],
//       ),
//       Song(
//         id: '4',
//         title: 'Levitating',
//         artist: 'Dua Lipa',
//         album: 'Future Nostalgia',
//         genre: 'Disco-pop',
//         duration: 203,
//         releaseDate: DateTime(2020, 10, 1),
//         tempo: 103,
//         energy: 0.9,
//         danceability: 0.95,
//         tags: ['disco', 'dance', 'upbeat'],
//       ),
//       Song(
//         id: '5',
//         title: 'Heat Waves',
//         artist: 'Glass Animals',
//         album: 'Dreamland',
//         genre: 'Indie Pop',
//         duration: 238,
//         releaseDate: DateTime(2020, 6, 29),
//         tempo: 81,
//         energy: 0.6,
//         danceability: 0.7,
//         tags: ['chill', 'indie'],
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('🎯 AI Recommendations'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.refresh),
//             onPressed: _isLoading ? null : _loadRecommendations,
//           ),
//         ],
//       ),
//       body: _isLoading
//           ? const Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircularProgressIndicator(),
//                   SizedBox(height: 16),
//                   Text(
//                     'Analyzing your music taste...',
//                     style: TextStyle(color: Colors.white70),
//                   ),
//                 ],
//               ),
//             )
//           : Column(
//               children: [
//                 // Filter Chips
//                 SizedBox(
//                   height: 60,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     children: [
//                       _buildFilterChip('All', 'all'),
//                       _buildFilterChip('Based on History', 'history'),
//                       _buildFilterChip('Similar Artists', 'artists'),
//                       _buildFilterChip('Mood Based', 'mood'),
//                       _buildFilterChip('New Releases', 'new'),
//                     ],
//                   ),
//                 ),
//                 const Divider(height: 1),

//                 // Recommendation Stats
//                 Container(
//                   padding: const EdgeInsets.all(16),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             '${_recommendedSongs.length} Songs',
//                             style: const TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                           const Text(
//                             'Personalized for you',
//                             style: TextStyle(color: Colors.white70),
//                           ),
//                         ],
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 12, vertical: 6),
//                         decoration: BoxDecoration(
//                           color: Colors.purple.withOpacity(0.2),
//                           borderRadius: BorderRadius.circular(20),
//                           border: Border.all(color: Colors.purple),
//                         ),
//                         child: const Row(
//                           children: [
//                             Icon(Icons.psychology, size: 16, color: Colors.purple),
//                             SizedBox(width: 4),
//                             Text(
//                               'AI Powered',
//                               style: TextStyle(
//                                 color: Colors.purple,
//                                 fontSize: 12,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 // Recommendations List
//                 Expanded(
//                   child: ListView.builder(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     itemCount: _recommendedSongs.length,
//                     itemBuilder: (context, index) {
//                       final song = _recommendedSongs[index];
//                       return RecommendationCard(
//                         song: song,
//                         confidence: 0.85 - (index * 0.05),
//                         reason: _getRecommendationReason(index),
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => PlayerScreen(song: song),
//                             ),
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }

//   Widget _buildFilterChip(String label, String value) {
//     final isSelected = _selectedFilter == value;
//     return Padding(
//       padding: const EdgeInsets.only(right: 8, top: 12),
//       child: ChoiceChip(
//         label: Text(label),
//         selected: isSelected,
//         onSelected: (selected) {
//           setState(() => _selectedFilter = value);
//         },
//         selectedColor: Colors.purple,
//         labelStyle: TextStyle(
//           color: isSelected ? Colors.white : Colors.white70,
//         ),
//       ),
//     );
//   }

//   String _getRecommendationReason(int index) {
//     final reasons = [
//       'Based on your recent plays',
//       'Similar to artists you like',
//       'Matches your energy preferences',
//       'Popular in your favorite genre',
//       'Trending among similar listeners',
//     ];
//     return reasons[index % reasons.length];
//   }
// }