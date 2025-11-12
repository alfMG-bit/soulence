import 'package:flutter/material.dart';
import 'package:soulence/main.dart';
import 'package:material_symbols_icons/symbols.dart'; //google font icons


class Podcasts extends StatefulWidget{
  const Podcasts({super.key});

  @override
  State<Podcasts> createState() => PodcastsState();
}

class PodcastsState extends State<Podcasts>{

  double customFontSize = 20.0;
  double iconsSize = 20.0;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Soulence",
          style: TextStyle(
            color: Colors.white,
            // fontsize: font_size,
          ),
        ),
        backgroundColor: AppColors.darkBrown,
        centerTitle: true,
      ),

      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            DrawerHeader(
              child: CircleAvatar(
                backgroundImage: AssetImage('lib/assets/images/logo.png'),
                radius: 50,
              ),
            ),
            // ------ candles ------
            ListTile(
              onTap: (){
                Navigator.pushNamed(context, '/candles.dart');
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
            // ------ guides_sessions ------
            // ------ ai_assistant ------
          ],
        ),
      ),
    );
  }
}