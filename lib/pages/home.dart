import 'package:flutter/material.dart';
import 'package:soulence/main.dart';
import 'package:material_symbols_icons/symbols.dart'; //google font icons

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context){

    double widhtContainers = 160.0;
    double iconsSize = 32.0;
    double sizedBoxesSize = 5.0;
    // double container_text = 10.0:

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Soulence",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.darkPink,
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
                radius: 50,
                backgroundImage: AssetImage('lib/assets/images/logo.png'),
              ),
            ),
            ListTile(
              leading: Icon(
                Symbols.person,
                color: AppColors.darkBrown, 
                size: iconsSize,
                ),
              title: Text(
                "Mi cuenta",
                style: TextStyle(
                  color: AppColors.darkBrown,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 10,),
            ListTile(
              onTap: (){
                Navigator.pushNamed(context, '/login.dart');
              },
              leading: Icon(
                Symbols.exit_to_app,
                color: AppColors.darkBrown, 
                size: iconsSize,
                ),
              title: Text(
                "Cerrar sesión",
                style: TextStyle(
                  color: AppColors.darkBrown,
                  fontSize: 18,
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
              AppColors.darkPink,
              AppColors.lightPink,
              Colors.white,
            ]
          )
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // -------------------------- CANDLES SECTION --------------------------
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    height: 100.0,
                    width: widhtContainers,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Symbols.candle,
                            color: AppColors.darkBrown,
                            size: iconsSize,
                          ),
                          SizedBox(height: sizedBoxesSize,),
                          Text(
                            "Velas",
                            style: TextStyle(
                              color: AppColors.darkBrown,
                            ),
                          ),
                        ],
                      ),
                    ), 
                  ),
                ),
                // -------------------------- PODCASTS SECTION --------------------------
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/podcasts.dart');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      height: 100.0,
                      width: widhtContainers,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Symbols.headphones,
                              color: AppColors.darkBrown,
                              size: iconsSize,
                            ),
                            SizedBox(height: sizedBoxesSize,),
                            Text(
                              "Podcast",
                              style: TextStyle(
                                color: AppColors.darkBrown,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  
                ),
                // -----------------------GUIDED SESSIONS SECTION--------------------------
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    height: 100.0,
                    width: widhtContainers,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Symbols.communication,
                            color: AppColors.darkBrown,
                            size: iconsSize,
                          ),
                          SizedBox(height: sizedBoxesSize,),
                          Text(
                            "Sesiones guiadas",
                            style: TextStyle(
                              color: AppColors.darkBrown,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // -------------------------- AI ASSISTANT SECTION --------------------------
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    height: 100.0,
                    width: widhtContainers,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Icon(
                            Symbols.support_agent,
                            color: AppColors.darkBrown,
                            size: iconsSize,
                          ),
                          SizedBox(height: sizedBoxesSize,),
                          Text(
                            "Asistente virual",
                            style: TextStyle(
                              color: AppColors.darkBrown,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

