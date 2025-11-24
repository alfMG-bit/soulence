import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soulence/main.dart';
import 'package:soulence/widgets/app_bar.dart';
import 'package:soulence/widgets/app_drawer.dart';
import 'package:material_symbols_icons/symbols.dart';

class Candles extends StatelessWidget {
  const Candles({super.key});

  // Método para mostrar el diálogo de pago
  void _showPaymentDialog(BuildContext context) {
    final cardNumberController = TextEditingController();
    final cardHolderController = TextEditingController();
    final expiryDateController = TextEditingController();
    final cvvController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(Icons.credit_card, color: AppColors.darkBrown),
              SizedBox(width: 8),
              Text("Datos de Tarjeta"),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                SizedBox(height: 16),

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
                SizedBox(height: 16),

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
                    SizedBox(width: 16),
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
                _showDiscountCode(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.darkBrown,
              ),
              child: Text(
                "Pagar",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    ).then((_) {
      // Limpiar controladores
      cardNumberController.dispose();
      cardHolderController.dispose();
      expiryDateController.dispose();
      cvvController.dispose();
    });
  }

  void _showDiscountCode(BuildContext context) {
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
                "Gracias por tu compra",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                "Tu código de descuento:",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: BoxDecoration(
                  color: AppColors.lightBrown.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColors.darkBrown,
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Text(
                  "B6DD654NT8",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 8,
                    color: AppColors.darkBrown,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
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
    return Scaffold(
      appBar: const AppAppBar(title: "Vela"),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/vela_soulence.png',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Vela aromática",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        "Precio: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 2),
                      Icon(
                        Symbols.attach_money,
                        size: 16,
                      ),
                      Text("0.00"),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        "Aroma: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 2),
                      Text("Lavanda, sándalo y manzanilla"),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        "Dimensiones: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 2),
                      Text("8.5 cm x 10.1 cm"),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Fabricado en Calle Aromas del Alma No. 108, Col. San Cayetano, C.P. 42088, Pachuca de Soto, Hidalgo, México"
                  ),
                  const SizedBox(height: 4,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/return_policy.dart');
                    },
                    child: Text(
                      'Política de devoluciones',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: AppColors.darkBrown
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        _showPaymentDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.darkBrown,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Comprar",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Formateador para número de tarjeta (añade espacios cada 4 dígitos)
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

// Formateador para fecha de vencimiento (formato MM/AA)
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