// import 'package:flutter/material.dart';
// import 'package:music_recommendation_app/models/song_model.dart';

// class PlayerWidget extends StatelessWidget {
//   final Song song;
//   final VoidCallback onTap;

//   const PlayerWidget({
//     super.key,
//     required this.song,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: Colors.white10,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Row(
//           children: [
//             // Album Art
//             Container(
//               width: 50,
//               height: 50,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 color: Colors.purple.shade900,
//                 image: song.imageUrl != null
//                     ? DecorationImage(
//                         image: NetworkImage(song.imageUrl!),
//                         fit: BoxFit.cover,
//                       )
//                     : null,
//               ),
//               child: song.imageUrl == null
//                   ? const Icon(
//                       Icons.music_note,
//                       color: Colors.white,
//                     )
//                   : null,
//             ),
//             const SizedBox(width: 12),

//             // Song Info
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     song.title,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     '${song.artist} • ${song.album}',
//                     style: const TextStyle(
//                       color: Colors.white70,
//                       fontSize: 12,
//                     ),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ],
//               ),
//             ),

//             // Play Button
//             IconButton(
//               icon: const Icon(
//                 Icons.play_arrow,
//                 color: Colors.purple,
//                 size: 30,
//               ),
//               onPressed: onTap,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }