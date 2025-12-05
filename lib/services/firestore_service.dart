// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:music_recommendation_app/models/song_model.dart';
// import 'package:music_recommendation_app/models/user_model.dart';

// class FirestoreService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // Song operations
//   Future<List<Song>> getTrendingSongs({int limit = 10}) async {
//     try {
//       final querySnapshot = await _firestore
//           .collection('songs')
//           .orderBy('playCount', descending: true)
//           .limit(limit)
//           .get();

//       return querySnapshot.docs
//           .map((doc) => Song.fromFirestore(doc.data(), doc.id))
//           .toList();
//     } catch (e) {
//       print('Error getting trending songs: $e');
//       return [];
//     }
//   }

//   Future<List<Song>> getSongsByGenre(String genre, {int limit = 10}) async {
//     try {
//       final querySnapshot = await _firestore
//           .collection('songs')
//           .where('genre', isEqualTo: genre)
//           .limit(limit)
//           .get();

//       return querySnapshot.docs
//           .map((doc) => Song.fromFirestore(doc.data(), doc.id))
//           .toList();
//     } catch (e) {
//       print('Error getting songs by genre: $e');
//       return [];
//     }
//   }

//   Future<Song?> getSongById(String songId) async {
//     try {
//       final doc = await _firestore.collection('songs').doc(songId).get();
//       if (doc.exists) {
//         return Song.fromFirestore(doc.data()!, doc.id);
//       }
//       return null;
//     } catch (e) {
//       print('Error getting song: $e');
//       return null;
//     }
//   }

//   Future<void> incrementPlayCount(String songId) async {
//     try {
//       await _firestore.collection('songs').doc(songId).update({
//         'playCount': FieldValue.increment(1),
//         'lastPlayed': FieldValue.serverTimestamp(),
//       });
//     } catch (e) {
//       print('Error incrementing play count: $e');
//     }
//   }

//   // User operations
//   Future<void> updateUserPreferences(
//       String userId, List<String> favoriteGenres) async {
//     try {
//       await _firestore.collection('users').doc(userId).update({
//         'favoriteGenres': favoriteGenres,
//         'updatedAt': FieldValue.serverTimestamp(),
//       });
//     } catch (e) {
//       print('Error updating user preferences: $e');
//     }
//   }

//   Future<void> addToListeningHistory(String userId, String songId) async {
//     try {
//       await _firestore.collection('users').doc(userId).update({
//         'listeningHistory': FieldValue.arrayUnion([songId]),
//         'lastPlayedAt': FieldValue.serverTimestamp(),
//       });
//     } catch (e) {
//       print('Error adding to listening history: $e');
//     }
//   }

//   Future<void> rateSong(String userId, String songId, int rating) async {
//     try {
//       final ratingPath = 'songRatings.$songId';
//       await _firestore.collection('users').doc(userId).update({
//         ratingPath: rating,
//         'lastRatedAt': FieldValue.serverTimestamp(),
//       });
//     } catch (e) {
//       print('Error rating song: $e');
//     }
//   }

//   Future<void> likeSong(String userId, String songId) async {
//     try {
//       await _firestore.collection('users').doc(userId).update({
//         'likedSongs': FieldValue.arrayUnion([songId]),
//       });
//     } catch (e) {
//       print('Error liking song: $e');
//     }
//   }

//   Future<List<String>> getUserFavoriteGenres(String userId) async {
//     try {
//       final doc = await _firestore.collection('users').doc(userId).get();
//       if (doc.exists) {
//         final data = doc.data()!;
//         final genres = List<String>.from(data['favoriteGenres'] ?? []);
//         return genres;
//       }
//       return [];
//     } catch (e) {
//       print('Error getting user genres: $e');
//       return [];
//     }
//   }

//   // Get user listening history
//   Future<List<String>> getUserListeningHistory(String userId) async {
//     try {
//       final doc = await _firestore.collection('users').doc(userId).get();
//       if (doc.exists) {
//         final data = doc.data()!;
//         final history = List<String>.from(data['listeningHistory'] ?? []);
//         return history;
//       }
//       return [];
//     } catch (e) {
//       print('Error getting listening history: $e');
//       return [];
//     }
//   }
// }