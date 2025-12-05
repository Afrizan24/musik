// import 'package:flutter/material.dart';
// import 'package:music_recommendation_app/models/song_model.dart';

// class SongCard extends StatelessWidget {
//   final Song song;
//   final VoidCallback onTap;
//   final bool showDetails;

//   const SongCard({
//     super.key,
//     required this.song,
//     required this.onTap,
//     this.showDetails = true,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         margin: const EdgeInsets.only(right: 12),
//         width: 160,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Album Art
//             Container(
//               width: 160,
//               height: 160,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color: Colors.purple.shade900,
//                 image: song.imageUrl != null
//                     ? DecorationImage(
//                         image: NetworkImage(song.imageUrl!),
//                         fit: BoxFit.cover,
//                       )
//                     : null,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.3),
//                     blurRadius: 8,
//                     offset: const Offset(0, 4),
//                   ),
//                 ],
//               ),
//               child: song.imageUrl == null
//                   ? const Center(
//                       child: Icon(
//                         Icons.music_note,
//                         size: 60,
//                         color: Colors.white,
//                       ),
//                     )
//                   : Stack(
//                       children: [
//                         Positioned(
//                           bottom: 8,
//                           right: 8,
//                           child: Container(
//                             padding: const EdgeInsets.all(6),
//                             decoration: BoxDecoration(
//                               color: Colors.black.withOpacity(0.7),
//                               shape: BoxShape.circle,
//                             ),
//                             child: const Icon(
//                               Icons.play_arrow,
//                               color: Colors.white,
//                               size: 20,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//             ),
//             const SizedBox(height: 12),

//             // Song Info
//             Text(
//               song.title,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 14,
//               ),
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//             ),
//             const SizedBox(height: 4),
//             Text(
//               song.artist,
//               style: const TextStyle(
//                 color: Colors.white70,
//                 fontSize: 12,
//               ),
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//             ),

//             if (showDetails) ...[
//               const SizedBox(height: 8),
//               Row(
//                 children: [
//                   const Icon(
//                     Icons.schedule,
//                     size: 12,
//                     color: Colors.white54,
//                   ),
//                   const SizedBox(width: 4),
//                   Text(
//                     _formatDuration(song.duration),
//                     style: const TextStyle(
//                       color: Colors.white54,
//                       fontSize: 11,
//                     ),
//                   ),
//                   const Spacer(),
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 6,
//                       vertical: 2,
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.purple.withOpacity(0.2),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Text(
//                       song.genre,
//                       style: const TextStyle(
//                         color: Colors.purple,
//                         fontSize: 10,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }

//   String _formatDuration(int seconds) {
//     final minutes = (seconds / 60).floor();
//     final remainingSeconds = seconds % 60;
//     return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
//   }
// }