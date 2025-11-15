import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soulence/main.dart';
import 'package:material_symbols_icons/symbols.dart';//google font icons
import 'package:soulence/pages/audio_provider.dart'; 
import 'package:soulence/pages/audio.dart';

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
      appBar: AppBar(
        title: Text(
          "Soulence Sesiones Guiadas",
          style: TextStyle(
            color: Colors.white,
            // fontsize: font_size,
          ),
        ),
        backgroundColor: AppColors.darkBrown,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),

      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            DrawerHeader(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/logo.png'),
                radius: 50,
              ),
            ),
            // ------ candles ------
            ListTile(
              onTap: (){
                //Navigator.pushNamed(context, '/candles.dart');
              },
              leading: Icon(
                Symbols.candle,
                color: AppColors.darkBrown,
                size: iconsSize,
              ),
              title: Text(
                "V E L A S",
                style: TextStyle(
                  fontSize: customFontSize,
                  color: AppColors.darkBrown,
                ),
              ),
            ),
            // ------ podcast ------
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/podcasts.dart');
              },
              leading: Icon(
                Symbols.headphones,
                color: AppColors.darkBrown,
                size: iconsSize,
              ),
              title: Text(
                "P O D C A S T",
                style: TextStyle(
                  fontSize: customFontSize,
                  color: AppColors.darkBrown
                ),
              ),
            ),
            // ------ guided_sessions ------
            ListTile(
              onTap: (){
                Navigator.pushNamed(context, '/guided_sessions.dart');
              },
              leading: Icon(
                Symbols.communication,
                color: AppColors.darkBrown,
                size: iconsSize,
              ),
              title: Text(
                "G U I D E D   S E S S I O N S",
                style:TextStyle(
                  fontSize: customFontSize,
                  color: AppColors.darkBrown,
                ),
              ),
            ),
            // ------ ai_assistant ------
            ListTile(
              onTap: (){
                // Navigator.pushNamed(context, '/ai_assistant.dart');
              },
              leading: Icon(
                Symbols.support_agent,
                color: AppColors.darkBrown,
                size: iconsSize,
              ),
              title: Text(
                "A S I S T E N T E   I A",
                style: TextStyle(
                  color: AppColors.darkBrown,
                  fontSize: customFontSize,
                ),
              ),
            ),
            // ------- my_account -------
            ListTile(
              onTap: (){
                // Navigator.pushNamed(context, 'my_account.dart');
              },
              leading: Icon(
                Symbols.person,
                color: AppColors.darkBrown, 
                size: iconsSize,
                ),
              title: Text(
                "M I   C U E N T A",
                style: TextStyle(
                  color: AppColors.darkBrown,
                  fontSize: customFontSize,
                ),
              ),
            ),
            // ------ exit session -----
            ListTile(
              onTap: (){
                Navigator.pushNamed(context, '/home.dart');
              },
              leading: Icon(
                Symbols.home,
                color: AppColors.darkBrown, 
                size: iconsSize,
                ),
              title: Text(
                "S A L I R",
                style: TextStyle(
                  color: AppColors.darkBrown,
                  fontSize: customFontSize,
                ),
              ),
            ),
          ],
        ),
      ),
      
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