import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:soulence/main.dart';
import 'package:soulence/services/membership_service.dart';

const double customFontSize = 12.0;
const double iconsSize = 20;

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  void _showMembershipStatus(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(Symbols.card_membership, color: AppColors.darkBrown),
              SizedBox(width: 8),
              Text("Estado de Membresía"),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.lightBrown.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.darkBrown),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Symbols.person, color: AppColors.darkBrown),
                    SizedBox(width: 8),
                    Text(
                      "Plan Gratuito",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkBrown,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Valor de membresía: \$10",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancelar",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _showDiscountCodeDialog(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.darkBrown,
              ),
              child: Text(
                "Comprar Membresía",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showDiscountCodeDialog(BuildContext context) {
    final codeController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Código de Descuento"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: codeController,
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                  labelText: "Ingresa código de descuento",
                  hintText: "XXXXX",
                  prefixIcon: Icon(Icons.local_offer),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("¿No tienes código? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/candles.dart');
                    },
                    child: Text(
                      "Obtén código de descuento",
                      style: TextStyle(
                        color: AppColors.darkBrown,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.darkBrown,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancelar",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _showPaymentDialog(context, hasDiscount: false);
              },
              child: Text(
                "Pagar sin código",
                style: TextStyle(color: AppColors.darkBrown),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String code = codeController.text.trim().toUpperCase();
                if (code == "XXXXX") {
                  Navigator.pop(context);
                  _showPaymentDialog(context, hasDiscount: true);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Código incorrecto"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.darkBrown,
              ),
              child: Text(
                "Verificar",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    ).then((_) {
      codeController.dispose();
    });
  }

  void _showPaymentDialog(BuildContext context, {required bool hasDiscount}) {
    final cardNumberController = TextEditingController();
    final cardHolderController = TextEditingController();
    final expiryDateController = TextEditingController();
    final cvvController = TextEditingController();

    double originalPrice = 10.0;
    double discount = hasDiscount ? originalPrice * 0.20 : 0.0;
    double finalPrice = originalPrice - discount;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(Icons.credit_card, color: AppColors.darkBrown),
              SizedBox(width: 8),
              Text("Pago de Membresía"),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Mostrar monto
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.lightBrown.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.darkBrown),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Monto a pagar:",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 4),
                      if (hasDiscount) ...[
                        Text(
                          "\$$originalPrice - 20% = \$${finalPrice.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkBrown,
                          ),
                        ),
                        Text(
                          "¡Ahorraste \$${discount.toStringAsFixed(2)}!",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ] else
                        Text(
                          "\$${originalPrice.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkBrown,
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 16),

                // Número de tarjeta
                TextField(
                  controller: cardNumberController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(16),
                    _CardNumberFormatter(),
                  ],
                  decoration: InputDecoration(
                    labelText: "Número de tarjeta",
                    hintText: "1234 5678 9012 3456",
                    prefixIcon: Icon(Icons.credit_card),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 12),

                // Nombre del titular
                TextField(
                  controller: cardHolderController,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                    labelText: "Titular de la tarjeta",
                    hintText: "NOMBRE APELLIDO",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 12),

                // Fecha de expiración y CVV
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: expiryDateController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4),
                          _ExpiryDateFormatter(),
                        ],
                        decoration: InputDecoration(
                          labelText: "Vencimiento",
                          hintText: "MM/AA",
                          prefixIcon: Icon(Icons.calendar_today),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        controller: cvvController,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(3),
                        ],
                        decoration: InputDecoration(
                          labelText: "CVV",
                          hintText: "123",
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancelar",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _showSuccessDialog(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.darkBrown,
              ),
              child: Text(
                "Confirmar Pago",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    ).then((_) {
      cardNumberController.dispose();
      cardHolderController.dispose();
      expiryDateController.dispose();
      cvvController.dispose();
    });
  }

  // Diálogo de éxito
  void _showSuccessDialog(BuildContext context) {
    final _membershipService = MembershipService();
    
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 32),
              SizedBox(width: 8),
              Text("¡Pago exitoso!"),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Tu membresía ha sido activada",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green, width: 2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Symbols.workspace_premium,
                        color: Colors.green, size: 32),
                    SizedBox(width: 8),
                    Text(
                      "Plan Premium",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                _membershipService.activatePremium();
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.darkBrown,
                minimumSize: Size(double.infinity, 45),
              ),
              child: Text(
                "Aceptar",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.png'),
              radius: 50,
            ),
          ),
          // ------ candles ------
          ListTile(
            onTap: () {
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
                  fontSize: customFontSize, color: AppColors.darkBrown),
            ),
          ),
          // ------ guided_sessions ------
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/guided_sessions.dart');
            },
            leading: Icon(
              Symbols.communication,
              color: AppColors.darkBrown,
              size: iconsSize,
            ),
            title: Text(
              "G U I D E D   S E S S I O N S",
              style: TextStyle(
                fontSize: customFontSize,
                color: AppColors.darkBrown,
              ),
            ),
          ),
          // ------ ai_assistant ------
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/ai_assistant.dart');
            },
            leading: Icon(
              Symbols.support_agent,
              color: AppColors.darkBrown,
              size: iconsSize,
            ),
            title: Text(
              "A S I S T E N T E   I A",
              style: TextStyle(
                color: AppColors.darkBrown,
                fontSize: customFontSize,
              ),
            ),
          ),
          // ------- my_account (ESTADO) -------
          ListTile(
            onTap: () {
              _showMembershipStatus(context);
            },
            leading: Icon(
              Symbols.card_membership,
              color: AppColors.darkBrown,
              size: iconsSize,
            ),
            title: Text(
              "E S T A D O",
              style: TextStyle(
                color: AppColors.darkBrown,
                fontSize: customFontSize,
              ),
            ),
          ),
          // ------ exit session -----
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/home.dart');
            },
            leading: Icon(
              Symbols.home,
              color: AppColors.darkBrown,
              size: iconsSize,
            ),
            title: Text(
              "S A L I R",
              style: TextStyle(
                color: AppColors.darkBrown,
                fontSize: customFontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Formateador para número de tarjeta
class _CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll(' ', '');
    final buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      if ((i + 1) % 4 == 0 && i + 1 != text.length) {
        buffer.write(' ');
      }
    }

    final string = buffer.toString();
    return TextEditingValue(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}

// Formateador para fecha de vencimiento
class _ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll('/', '');
    final buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      if (i == 1 && text.length > 2) {
        buffer.write('/');
      }
    }

    final string = buffer.toString();
    return TextEditingValue(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}