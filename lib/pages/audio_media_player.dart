import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soulence/main.dart';
import 'package:soulence/pages/neu_box.dart';
import 'package:soulence/pages/podcast_provider.dart';

class AudioMediaPlayer extends StatelessWidget{
  const AudioMediaPlayer({super.key});

  //convert duration into min:sec
  String formatTime(Duration duration){
    String twoDigitSeconds = duration.inSeconds.remainder(60).toString().padLeft(2,'0');
    String formattedTime = "${duration.inMinutes}:$twoDigitSeconds";

    return formattedTime;
  }
  @override
  Widget build(BuildContext context){
    return Consumer<PodcastProvider>(
      builder: (context, value, child){

        //get playlist
        final podcastPlaylist= value.podcastPlaylist;

        // get current song index
        final currentPodcast = podcastPlaylist[value.currentPodcastIndex ?? 0];

        //return scaffold
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: (){
                value.pause();
                Navigator.pushNamed(context, '/podcasts.dart');
              },
              icon: Icon(Icons.arrow_back)
            ),
            title: Text(
              "Audio",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: AppColors.darkBrown,
            centerTitle: true,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
          ),
          body: Column(
            children: [
              NeuBox(
                child: Column(
                  children: [
                    //image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(currentPodcast.coverPath),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                currentPodcast.audioName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(currentPodcast.duration),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  //start time
                                  Text(formatTime(value.currentDuration)),
                                  //fill this
                                  Text("Soulence Podcast"),
                                  //end time
                                  Text(formatTime(value.totalDuration)),
                                ],
                              ),

                              SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  thumbShape:
                                    const RoundSliderThumbShape(enabledThumbRadius: 0),
                                ),
                                child: Slider(
                                  min: 0,
                                  max: value.totalDuration.inSeconds.toDouble(),
                                  value:value.currentDuration.inSeconds.toDouble(),
                                  activeColor: AppColors.green,
                                  onChanged: (value){
                                    // during when the user is sliding around
                                  },
                                  onChangeEnd: (double double) {
                                    // sliding has finished, go to that position in song duration
                                    value.seek(Duration(seconds: double.toInt()));
                                  },
                                )
                              ),
                              
                              //playback controls
                              Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: value.pauseOrResume,
                                      child: NeuBox(
                                        child: Icon(value.isPlaying ? Icons.pause: Icons.play_arrow),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [

                ],
              ),
            ],
          ),
        );
      }
    );
  }
}