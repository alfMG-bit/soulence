// Create this new file: lib/services/auth_service.dart

class AuthService {
  // Singleton pattern - solo una instancia
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  // Lista para almacenar usuarios (en memoria)
  final List<Map<String, String>> _users = [];

  // Usuario actual
  Map<String, String>? _currentUser;

  // Registrar un nuevo usuario
  bool signUp({
    required String name,
    required String lastName,
    required String age,
    required String email,
    required String password,
  }) {
    // Verificar si el email ya existe
    bool emailExists = _users.any((user) => user['email'] == email);
    
    if (emailExists) {
      return false; // Email ya registrado
    }

    // Agregar nuevo usuario
    _users.add({
      'name': name,
      'lastName': lastName,
      'age': age,
      'email': email,
      'password': password,
    });

    return true; // Registro exitoso
  }

  // Iniciar sesión
  bool login({required String email, required String password}) {
    try {
      // Buscar usuario con ese email y contraseña
      _currentUser = _users.firstWhere(
        (user) => user['email'] == email && user['password'] == password,
      );
      return true; // Login exitoso
    } catch (e) {
      _currentUser = null;
      return false; // Credenciales incorrectas
    }
  }

  // Cerrar sesión
  void logout() {
    _currentUser = null;
  }

  // Obtener usuario actual
  Map<String, String>? get currentUser => _currentUser;

  // Verificar si hay sesión activa
  bool get isLoggedIn => _currentUser != null;

  // Para debug - ver usuarios registrados
  List<Map<String, String>> get allUsers => _users;
}