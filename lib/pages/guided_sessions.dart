import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soulence/main.dart';
//google font icons
import 'package:soulence/pages/audio_provider.dart'; 
import 'package:soulence/pages/audio.dart';
import 'package:soulence/widgets/app_bar.dart';
import 'package:soulence/widgets/app_drawer.dart';

class GuidedSessions extends StatefulWidget{
  const GuidedSessions({super.key});
  
  @override
  State<GuidedSessions> createState() => GuidedSessionsState();
}

class GuidedSessionsState extends State<GuidedSessions>{


  final double customFontSize = 12.0;
  final double iconsSize = 20.0;

  late final dynamic audioProvider;


  @override
  void initState(){
    super.initState();
    //get playlist of podcasts provider
    audioProvider = Provider.of<AudioProvider>(context, listen: false);
  }

  //go to podcast
  void goToSession(int sessionIndex){
    //update current song index
    audioProvider.playAudio(
      audioProvider.guidedSessionsPlaylist,
      sessionIndex
    );
    // navigate to audio player page
    Navigator.pushNamed(context, '/audio_media_player.dart');
  }


  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: const AppAppBar(title: "Sesiones guiadas"),

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
            final List<Audio> guidedSessionsPlaylist= value.guidedSessionsPlaylist;

            return ListView.builder(
              itemCount: guidedSessionsPlaylist.length,
              itemBuilder: (context, index){
                final Audio audio = guidedSessionsPlaylist[index];

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
                  onTap: () => goToSession(index),
                );
              },
            );
          },
        ),
      ),
    );
  }
}