import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; //fonts
import 'package:soulence/main.dart';


class Login extends StatefulWidget{
  const Login({super.key}); 

  @override
  State<Login> createState() => LoginPageState();
}

class LoginPageState extends State<Login> {

  TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar( 
        title: Text(
          "Soulence",
          style: GoogleFonts.questrial(
            fontSize: 20.0,
            color: Colors.white,
            ),
          ),
        centerTitle: true,
        backgroundColor: AppColors.darkPink,
        leading: Container(), //does not show the arrow that goes back
        ),
        

      body: Container(
        decoration: const BoxDecoration(
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
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/images/logo.png"),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Form(
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "Correo",
                            hintText: "ejemplo@ejemplo.com",
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(),
                          ),
                                
                          onChanged: (String value){
                                
                          },
                          validator: (value){
                            return value!.isEmpty ? 'Por favor ingresa un correo' : null;
                          },
                        ),
                        SizedBox(height: 30,),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            labelText: "Contraseña",
                            hintText: "Ingresa tu contraseña",
                            prefixIcon: Icon(Icons.key),
                            border:OutlineInputBorder(),
                          ),
                          onChanged: (String value){
                                
                          },
                          validator: (value){
                            return value!.isNotEmpty ? 'Por favor ingresa una contraseña' : null;
                          },
                        ),
                        SizedBox(height: 30,),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: ElevatedButton(
                            onPressed: (){
                              Navigator.pushNamed(context, '/home.dart');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.darkPink,
                              minimumSize: Size(double.infinity, 50),
                            ),
                            child: Text(
                              "Inciar sesión",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                              "¿No tienes cuenta?",
                              ),
                              SizedBox(width: 10,),
                              TextButton(
                                onPressed: (){
                                  Navigator.pushNamed(context, '/sign_up.dart');
                                },
                                child: Text(
                                  "Regístrate",
                                  style: TextStyle(
                                    color: AppColors.darkPink,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.darkPink,
                                  ),
                                ),    
                              ),
                            ],
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

class GlassContainer {
  GlassContainer(BuildContext context);
}
