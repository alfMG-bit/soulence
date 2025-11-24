import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soulence/main.dart';
import 'package:soulence/services/auth_services.dart'; // Importar el servicio

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => LoginPageState();
}

class LoginPageState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _authService = AuthService(); // Instancia del servicio

  void _loginUser() {
    if (_formKey.currentState!.validate()) {
      bool success = _authService.login(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (success) {
        // Login exitoso
        Navigator.pushReplacementNamed(context, '/home.dart');
      } else {
        // Credenciales incorrectas
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Correo o contraseña incorrectos"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
        leading: Container(),
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
            ],
          ),
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
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: "Correo",
                              hintText: "ejemplo@ejemplo.com",
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor ingresa un correo';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 30),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              labelText: "Contraseña",
                              hintText: "Ingresa tu contraseña",
                              prefixIcon: Icon(Icons.key),
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor ingresa una contraseña';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: ElevatedButton(
                              onPressed: _loginUser,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.darkPink,
                                minimumSize: Size(double.infinity, 50),
                              ),
                              child: Text(
                                "Iniciar sesión",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("¿No tienes cuenta?"),
                              SizedBox(width: 10),
                              TextButton(
                                onPressed: () {
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