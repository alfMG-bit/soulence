import 'package:flutter/material.dart';
import 'package:soulence/main.dart';

class SignUp extends StatefulWidget{
  const SignUp({super.key});

  @override
  State<SignUp> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUp>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Soulence",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.darkPink,
        centerTitle: true,
        leading: Container(),
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
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("lib/assets/images/logo.png"),
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
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              labelText: "Nombre",
                              hintText: "Ingresa tu nombre",
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (String value) {

                            },
                            validator: (value){
                              return value!.isNotEmpty ? "Por favor ingrese su nombre" : null;
                            },
                          ),
                          SizedBox(height: 20,),
                          TextFormField(
                            keyboardType: TextInputType.name, //verify how to read it as lastname
                            decoration: InputDecoration(
                              labelText: "Apellidos",
                              hintText: "Ingresa tus apellidos",
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (String value){

                            },
                            validator: (value){
                              return value!.isNotEmpty ? "Por favor ingrese sus apellidos" : null;
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Edad",
                              hintText: "Ingresa tu edad",
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (String value){

                            },
                            validator: (value){
                              return value!.isNotEmpty ? "Por favor ingrese su edad" : null;                            
                            },
                          ),
                          SizedBox(height: 20.0,),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: "Correo electrónico",
                              hintText: "Ingresa tu correo",
                              border: OutlineInputBorder()
                            ),
                            onChanged: (String value){

                            },
                            validator: (value){
                              return value!.isNotEmpty ? "Por favor ingrese su correo electrónico" : null;
                            
                            },
                          ),
                          SizedBox(height: 20.0,),
                          TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              labelText: "Contraseña",
                              hintText: "Ingrese una contraseña",
                              border: OutlineInputBorder()
                            ),
                            onChanged: (String value){

                            },
                            validator: (value){
                              return value!.isNotEmpty ? "Por favor ingrese una contraseña" : null;
                            
                            },
                          ),
                          SizedBox(height: 20.0,),
                          TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              labelText: "Confirme su contraseña",
                              hintText: "Confirme su contraseña",
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (String value){

                            },
                            validator: (value){
                              return value!.isNotEmpty ? "Por favor confirme su contaseña" : null;
                            
                            },
                          ),
                          SizedBox(height: 20.0),
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: ElevatedButton(
                              onPressed: (){
                                Navigator.pushNamed(context, '/login.dart');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.darkPink,
                                minimumSize: Size(double.infinity, 50),
                              ),
                              child: Text(
                                "Registrarme",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "¿Ya tienes una cuenta?"
                              ),
                              SizedBox(width: 10.0,),
                              TextButton(
                                onPressed: (){
                                  Navigator.pushNamed(context, '/login.dart');
                                },
                                child: Text(
                                  "Iniciar Sesión",
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