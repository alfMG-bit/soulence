import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soulence/main.dart';
import 'package:soulence/pages/neu_box.dart';
import 'package:soulence/pages/audio_provider.dart';
import 'package:material_symbols_icons/symbols.dart';//google font icons

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
    return Consumer<AudioProvider>(
      builder: (context, value, child){

       //icon and font size
       final double customFontSize = 12.0;
       final double iconsSize = 20.0;
       // current audio
       final currentAudio = value.currentAudio;

       if (currentAudio == null) {
          return Scaffold(
            appBar: AppBar(title: Text("Error")),
            body: Center(child: Text("No se está reproduciendo audio.")),
          );
        }

        //return scaffold
        return Scaffold(
          appBar: AppBar(
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
                    value.pause();
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
                    value.pause();
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
                    value.pause();
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
                    value.pause();
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
      
          body: Column(
            children: [
              NeuBox(
                child: Column(
                  children: [
                    //image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(currentAudio.coverPath),
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
                                currentAudio.audioName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(currentAudio.author),
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