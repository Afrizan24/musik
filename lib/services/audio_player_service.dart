// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/foundation.dart';

// class AudioPlayerService with ChangeNotifier {
//   final AudioPlayer _player = AudioPlayer();
//   bool _isPlaying = false;
//   Duration _duration = Duration.zero;
//   Duration _position = Duration.zero;
//   String? _currentSongId;

//   bool get isPlaying => _isPlaying;
//   Duration get duration => _duration;
//   Duration get position => _position;
//   String? get currentSongId => _currentSongId;

//   AudioPlayerService() {
//     _setupListeners();
//   }

//   void _setupListeners() {
//     _player.onPlayerStateChanged.listen((PlayerState state) {
//       _isPlaying = state == PlayerState.playing;
//       notifyListeners();
//     });

//     _player.onDurationChanged.listen((Duration duration) {
//       _duration = duration;
//       notifyListeners();
//     });

//     _player.onPositionChanged.listen((Duration position) {
//       _position = position;
//       notifyListeners();
//     });
//   }

//   Future<void> play(String songId, String audioUrl) async {
//     try {
//       if (_currentSongId != songId) {
//         await _player.stop();
//         await _player.setSourceUrl(audioUrl);
//         _currentSongId = songId;
//       }
//       await _player.resume();
//     } catch (e) {
//       print('Error playing audio: $e');
//     }
//   }

//   Future<void> pause() async {
//     await _player.pause();
//   }

//   Future<void> resume() async {
//     await _player.resume();
//   }

//   Future<void> stop() async {
//     await _player.stop();
//     _currentSongId = null;
//     _position = Duration.zero;
//     notifyListeners();
//   }

//   Future<void> seek(Duration position) async {
//     await _player.seek(position);
//   }

//   Future<void> setVolume(double volume) async {
//     await _player.setVolume(volume);
//   }

//   Future<void> disposePlayer() async {
//     await _player.dispose();
//   }
// }