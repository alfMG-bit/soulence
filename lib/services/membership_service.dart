// Crear este archivo en: lib/services/membership_service.dart

class MembershipService {
  // Singleton pattern
  static final MembershipService _instance = MembershipService._internal();
  factory MembershipService() => _instance;
  MembershipService._internal();

  // Estado de membresía
  bool _isPremium = false;

  // Getter para verificar si es premium
  bool get isPremium => _isPremium;

  // Activar membresía premium
  void activatePremium() {
    _isPremium = true;
  }

  // Desactivar membresía premium (para testing)
  void deactivatePremium() {
    _isPremium = false;
  }

  // Obtener nombre del plan
  String get planName => _isPremium ? "Plan Premium" : "Plan Gratuito";
}