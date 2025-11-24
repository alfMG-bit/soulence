import 'package:flutter/material.dart';
import 'package:soulence/pages/audio.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioProvider extends ChangeNotifier{

  static const String coverPathPodcast = "assets/images/podcast_image.png";
  static const String coverPathGuidedSessions = "assets/images/podcast_image.png";

  
  // ---------PLAYLIST PODCAST ------
  final List<Audio>  _podcastPlaylist = [
    //free podcast
    Audio(
      audioName: "Bienvenid@ a Soulence Podcast",
      author: "Soulence",
      coverPath: coverPathPodcast, 
      audioPath: "assets/podcast/podcast_test.mp3",
      audioType: true,
    ),
    //podcast 1
    //podcast 2
  ];

  // ---------- PLAYLIST GUIDED SESSIONS
  final List<Audio> _guidedSessionsPlaylist = [
    //free guided session
    Audio(
      audioName: "Nuestras velas",
      author: "Soulence", 
      coverPath: coverPathGuidedSessions,
      audioPath: "assets/guided_sessions/vela_soulence.mp3",
      audioType: true,
    ),
    //stress guided session
    Audio(
      audioName: "Sesión guiada para estrés",
      author: "Soulence", 
      coverPath: coverPathGuidedSessions,
      audioPath: "assets/guided_sessions/estres.mp3",
      audioType: false,
    ),
    //anxiety guided session
    Audio(
      audioName: "Sesión guiada para ansiedad",
      author: "Soulence", 
      coverPath: coverPathGuidedSessions,
      audioPath: "assets/guided_sessions/ansiedad.mp3",
      audioType: false,
    ),
  ];

  //current playlist and audio playing
  List<Audio> _activePlaylist = [];
  int? _currentIndex;

  // ------ AUDIO PLAYER ------
  // audio player
  final AudioPlayer _audioPlayer = AudioPlayer();
  // duration
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  //constructor
  AudioProvider(){
    listenToDuration();
  }

  // initially not playing
  bool _isPlaying = false;

  // play the song
  void play() async {
    final String path = _activePlaylist[_currentIndex!].audioPath;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    _isPlaying = true;
    notifyListeners();
  }
  // pause current song
  void pause () async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }
  // resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }
  // pause or resume
  void pauseOrResume() async {
    if(_isPlaying){
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  // seek to a specific position in the current song 
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }
  // listen to duration
  void listenToDuration() {
    // listen for total duration
    _audioPlayer.onDurationChanged.listen((newDuration){
      _totalDuration = newDuration;
      notifyListeners();
    });
    //listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition){
      _currentDuration = newPosition;
      notifyListeners();
    });
    // listen for song completion
    _audioPlayer.onPlayerComplete.listen((event) {});
  }
  
  // check active playlist, asign new index and call play)()
  void playAudio(List<Audio> playlist, int index){
    _activePlaylist = playlist;
    _currentIndex = index;
    play();
  }

  // ---- GETTERS ----
  List<Audio> get podcastPlaylist => _podcastPlaylist;
  List<Audio> get guidedSessionsPlaylist => _guidedSessionsPlaylist;
  Audio? get currentAudio {
    if (_currentIndex == null || _activePlaylist.isEmpty) {
      return null;
    }
    return _activePlaylist[_currentIndex!];
  }
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  // ---- SETTERS ----
  set currentPodcastIndex(int? newIndex){
    _currentIndex = newIndex;

    if(newIndex != null){
      play();
    }
    notifyListeners();
  }
}

