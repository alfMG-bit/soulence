import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soulence/pages/audio_media_player.dart';
import 'package:soulence/pages/guided_sessions.dart';
import 'package:soulence/pages/login.dart';
import 'package:soulence/pages/audio_provider.dart';
import 'package:soulence/pages/podcasts.dart';
import 'package:soulence/pages/sign_up.dart';
import 'package:soulence/pages/home.dart';
import 'package:soulence/pages/chatbot/chat_provider.dart';
import 'package:soulence/pages/ai_assistant.dart';
import 'package:provider/provider.dart';
import 'package:soulence/pages/candles.dart';
import 'package:soulence/pages/contacts.dart';
import 'package:soulence/pages/return_policy.dart';

// YA NO NECESITAS FIREBASE
// Elimina o comenta estas líneas:
// import 'package:soulence/firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // YA NO NECESITAS INICIALIZAR FIREBASE
  // Comenta o elimina:
  // await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform, 
  // );
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AudioProvider()),
        ChangeNotifierProvider(create: (context) => ChatProvider()),      
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
      routes: {
        '/login.dart': (context) => Login(),
        '/sign_up.dart': (context) => SignUp(),
        '/home.dart': (context) => HomePage(),
        '/podcasts.dart': (context) => Podcasts(),
        '/guided_sessions.dart': (context) => GuidedSessions(),
        '/audio_media_player.dart': (context) => AudioMediaPlayer(),
        '/ai_assistant.dart': (context) => AiAssistant(),
        '/candles.dart': (context) => Candles(),
        '/contacts.dart': (context) => Contacts(),
        '/return_policy.dart': (context) => ReturnPolicy(),
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