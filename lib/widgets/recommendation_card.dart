// import 'package:flutter/material.dart';
// import 'package:music_recommendation_app/models/song_model.dart';

// class RecommendationCard extends StatelessWidget {
//   final Song song;
//   final double confidence;
//   final String reason;
//   final VoidCallback onTap;

//   const RecommendationCard({
//     super.key,
//     required this.song,
//     required this.confidence,
//     required this.reason,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Colors.white10,
//       margin: const EdgeInsets.only(bottom: 12),
//       child: InkWell(
//         onTap: onTap,
//         borderRadius: BorderRadius.circular(12),
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Confidence Indicator
//               Container(
//                 width: 40,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: _getConfidenceColor(confidence),
//                 ),
//                 child: Center(
//                   child: Text(
//                     '${(confidence * 100).toInt()}',
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 16),

//               // Song Info
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Text(
//                             song.title,
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ),
//                         Icon(
//                           Icons.recommend,
//                           color: Colors.purple,
//                           size: 20,
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       song.artist,
//                       style: const TextStyle(color: Colors.white70),
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       reason,
//                       style: TextStyle(
//                         color: Colors.white.withOpacity(0.7),
//                         fontSize: 12,
//                         fontStyle: FontStyle.italic,
//                       ),
//                     ),
//                     const SizedBox(height: 8),

//                     // Tags
//                     Wrap(
//                       spacing: 6,
//                       runSpacing: 4,
//                       children: [
//                         ...song.tags.map((tag) {
//                           return Container(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 8,
//                               vertical: 2,
//                             ),
//                             decoration: BoxDecoration(
//                               color: Colors.purple.withOpacity(0.2),
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: Text(
//                               tag,
//                               style: const TextStyle(
//                                 color: Colors.purple,
//                                 fontSize: 10,
//                               ),
//                             ),
//                           );
//                         }),
//                         if (song.genre.isNotEmpty)
//                           Container(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 8,
//                               vertical: 2,
//                             ),
//                             decoration: BoxDecoration(
//                               color: Colors.blue.withOpacity(0.2),
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: Text(
//                               song.genre,
//                               style: const TextStyle(
//                                 color: Colors.blue,
//                                 fontSize: 10,
//                               ),
//                             ),
//                           ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),

//               // Play Button
//               IconButton(
//                 icon: const Icon(
//                   Icons.play_circle_filled,
//                   color: Colors.purple,
//                   size: 36,
//                 ),
//                 onPressed: onTap,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Color _getConfidenceColor(double confidence) {
//     if (confidence > 0.8) return Colors.green;
//     if (confidence > 0.6) return Colors.orange;
//     return Colors.red;
//   }
// }