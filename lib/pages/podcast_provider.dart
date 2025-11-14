import 'package:flutter/material.dart';
import 'package:soulence/pages/audio.dart';
import 'package:audioplayers/audioplayers.dart';

class PodcastProvider extends ChangeNotifier{
  //playlists of podcasts
  final List<Audio> _podcastPlaylist = [
    //free podcast
    Audio(
      audioName: "Bienvenid@ a Soulence Podcast",
      duration: "04:13",
      coverPath: "assets/images/podcast_image.png", 
      audioPath: "podcast/podcast_test.mp3",
    ),
    //podcast 1
    //podcast 2
  ];

  //current song playing index
  int? _currentPodcastIndex;

  // ------ AUDIO PLAYER ------
  // audio player
  final AudioPlayer _audioPlayer = AudioPlayer();
  // duration
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  //constructor
  PodcastProvider(){
    listenToDuration();
  }

  // initially not playing
  bool _isPlaying = false;

  // play the song
  void play() async {
    final String path = _podcastPlaylist[_currentPodcastIndex!].audioPath;
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
  // dispose audo player 

  // ---- GETTERS ----
  List<Audio> get podcastPlaylist => _podcastPlaylist;
  int? get currentPodcastIndex => _currentPodcastIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;
  // ---- SETTERS ----
  set currentPodcastIndex(int? newIndex){
    _currentPodcastIndex = newIndex;

    if(newIndex != null){
      play();
    }
    notifyListeners();
  }
}

