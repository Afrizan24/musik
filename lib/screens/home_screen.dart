// lib/screens/home_screen.dart (UPDATE)
import 'package:flutter/material.dart';
import 'package:musik/models/song_model.dart';
import 'package:musik/screens/player_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Song> songs = [
    Song(
      id: '1',
      title: 'Blinding Lights',
      artist: 'The Weeknd',
      album: 'After Hours',
      genre: 'Synth-pop',
      duration: 200,
      releaseDate: DateTime(2020, 3, 20),
    ),
    Song(
      id: '2',
      title: 'Stay',
      artist: 'The Kid LAROI, Justin Bieber',
      album: 'F*CK LOVE 3',
      genre: 'Pop',
      duration: 141,
      releaseDate: DateTime(2021, 7, 9),
    ),
    Song(
      id: '3',
      title: 'Heat Waves',
      artist: 'Glass Animals',
      album: 'Dreamland',
      genre: 'Indie Pop',
      duration: 238,
      releaseDate: DateTime(2020, 6, 29),
    ),
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🎵 Music Recommender AI'),
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
      body: Container(
        color: const Color(0xFF0F0F23),
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Icon(
                    Icons.music_note,
                    size: 60,
                    color: Colors.purple,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Personalized Music Recommendations',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Powered by Machine Learning',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Get recommendations
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                    ),
                    child: const Text('🎯 Get AI Recommendations'),
                  ),
                ],
              ),
            ),
            
            // Song List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  final song = songs[index];
                  return Card(
                    color: Colors.white10,
                    child: ListTile(
                      leading: const Icon(
                        Icons.music_note,
                        color: Colors.purple,
                      ),
                      title: Text(
                        song.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '${song.artist} • ${song.genre}',
                        style: const TextStyle(color: Colors.white70),
                      ),
                      trailing: const Icon(
                        Icons.play_arrow,
                        color: Colors.purple,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlayerScreen(song: song),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}