// lib/models/song_model.dart
class Song {
  final String id;
  final String title;
  final String artist;
  final String album;
  final String genre;
  final String? imageUrl;
  final int duration;
  final DateTime releaseDate;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.genre,
    this.imageUrl,
    required this.duration,
    required this.releaseDate,
  });
}