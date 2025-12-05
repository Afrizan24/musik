class UserModel {
  final String uid;
  final String email;
  final String displayName;
  final String? photoURL;
  final List<String> favoriteGenres;
  final List<String> listeningHistory;
  final Map<String, int> songRatings; // songId: rating (1-5)
  final List<String> likedSongs;
  final DateTime createdAt;

  UserModel({
    required this.uid,
    required this.email,
    required this.displayName,
    this.photoURL,
    this.favoriteGenres = const [],
    this.listeningHistory = const [],
    this.songRatings = const {},
    this.likedSongs = const [],
    required this.createdAt,
  });

  factory UserModel.fromFirestore(Map<String, dynamic> data, String id) {
    return UserModel(
      uid: id,
      email: data['email'] ?? '',
      displayName: data['displayName'] ?? 'User',
      photoURL: data['photoURL'],
      favoriteGenres: List<String>.from(data['favoriteGenres'] ?? []),
      listeningHistory: List<String>.from(data['listeningHistory'] ?? []),
      songRatings: Map<String, int>.from(data['songRatings'] ?? {}),
      likedSongs: List<String>.from(data['likedSongs'] ?? []),
      createdAt: data['createdAt']?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'email': email,
      'displayName': displayName,
      'photoURL': photoURL,
      'favoriteGenres': favoriteGenres,
      'listeningHistory': listeningHistory,
      'songRatings': songRatings,
      'likedSongs': likedSongs,
      'createdAt': createdAt,
    };
  }
}