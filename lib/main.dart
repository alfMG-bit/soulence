import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; //fonts
import 'package:soulence/pages/audio_media_player.dart';
import 'package:soulence/pages/login.dart';
import 'package:soulence/pages/podcast_provider.dart';
import 'package:soulence/pages/podcasts.dart';
import 'package:soulence/pages/sign_up.dart';
import 'package:soulence/pages/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PodcastProvider()),
      ],
      child: const MyApp(),
    )
  );
}

class AppColors {
  static const Color darkPink = Color(0xFFA26380);
  static const Color lightPink = Color(0xFFD6B1B5);
  static const Color darkBrown = Color(0xFFB0967B);
  static const Color lightBrown = Color(0xFFD9BD98);
  static const Color green = Color(0xFFA3A667);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:{
        '/login.dart': (context) => Login(),
        '/sign_up.dart': (context) => SignUp(),
        '/home.dart': (context) => HomePage(),
        '/podcasts.dart': (context) => Podcasts(),
        '/audio_media_player.dart': (context) => AudioMediaPlayer(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.questrialTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Login(),

    );
  }
}