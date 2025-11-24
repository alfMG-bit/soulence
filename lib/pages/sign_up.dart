import 'package:flutter/material.dart';
import 'package:soulence/main.dart';
import 'package:soulence/services/auth_services.dart'; // Importar el servicio

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUp> {
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _authService = AuthService(); // Instancia del servicio

  void _showDialog(String title, String content, bool isSuccess) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                if (isSuccess) {
                  Navigator.pushNamed(context, '/login.dart');
                }
              },
              child: Text("OK", style: TextStyle(color: AppColors.darkPink)),
            )
          ],
        );
      },
    );
  }

  void _registerUser() {
    if (_formKey.currentState!.validate()) {
      // Verificar que las contraseñas coincidan
      if (_passwordController.text.trim() !=
          _confirmPasswordController.text.trim()) {
        _showDialog("Error", "Las contraseñas no coinciden", false);
        return;
      }

      // Intentar registrar al usuario
      bool success = _authService.signUp(
        name: _nameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        age: _ageController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (success) {
        _showDialog("¡Éxito!", "Usuario creado exitosamente.", true);
      } else {
        _showDialog("Error", "Este correo ya está registrado.", false);
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                            controller: _nameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              labelText: "Nombre",
                              hintText: "Ingresa tu nombre",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              return value!.isNotEmpty
                                  ? null
                                  : "Por favor ingrese su nombre";
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _lastNameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              labelText: "Apellidos",
                              hintText: "Ingresa tus apellidos",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              return value!.isNotEmpty
                                  ? null
                                  : "Por favor ingrese sus apellidos";
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            controller: _ageController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Edad",
                              hintText: "Ingresa tu edad",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              return value!.isNotEmpty
                                  ? null
                                  : "Por favor ingrese su edad";
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: "Correo electrónico",
                              hintText: "Ingresa tu correo",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              return value!.isNotEmpty
                                  ? null
                                  : "Por favor ingrese su correo electrónico";
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              labelText: "Contraseña",
                              hintText: "Ingrese una contraseña",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              return value!.isNotEmpty
                                  ? null
                                  : "Por favor ingrese una contraseña";
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            controller: _confirmPasswordController,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              labelText: "Confirme su contraseña",
                              hintText: "Confirme su contraseña",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              return value!.isNotEmpty
                                  ? null
                                  : "Por favor confirme su contraseña";
                            },
                          ),
                          SizedBox(height: 20.0),
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: ElevatedButton(
                              onPressed: _registerUser,
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
                              Text("¿Ya tienes una cuenta?"),
                              SizedBox(width: 10.0),
                              TextButton(
                                onPressed: () {
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