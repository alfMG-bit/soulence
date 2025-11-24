import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soulence/main.dart';
import 'package:soulence/pages/audio_provider.dart'; 
import 'package:soulence/pages/audio.dart';
import 'package:soulence/widgets/app_bar.dart';
import 'package:soulence/widgets/app_drawer.dart';

class Podcasts extends StatefulWidget{
  const Podcasts({super.key});
  
  @override
  State<Podcasts> createState() => PodcastState();
}

class PodcastState extends State<Podcasts>{


  final double customFontSize = 12.0;
  final double iconsSize = 20.0;

  late final dynamic podcastPlaylistProvider;


  @override
  void initState(){
    super.initState();
    //get playlist of podcasts provider
    podcastPlaylistProvider = Provider.of<AudioProvider>(context, listen: false);
  }

  //go to podcast
  void goToPodcast(int podcastIndex){
    //update current song index
    podcastPlaylistProvider.playAudio(
      podcastPlaylistProvider.podcastPlaylist,
      podcastIndex
    );
    // navigate to audio player page
    Navigator.pushNamed(context, '/audio_media_player.dart');
  }


  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: const AppAppBar(title: "Podcast"),

      drawer: const AppDrawer(),

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.darkBrown,
              AppColors.lightBrown,
              Colors.white,
            ]
          ),
        ),
        child:Consumer<AudioProvider>(
          builder: (context, value, child)  {
            final List<Audio> podcastPlaylist = value.podcastPlaylist;

            return ListView.builder(
              itemCount: podcastPlaylist.length,
              itemBuilder: (context, index){
                final Audio audio = podcastPlaylist[index];

                return ListTile(
                  
                  title: Text(
                    audio.audioName,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    audio.author,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  leading: Image.asset(audio.coverPath),
                  onTap: () => goToPodcast(index),
                );
              },
            );
          },
        ),
      ),
    );
  }
}