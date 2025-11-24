import 'package:flutter/material.dart';
import 'package:soulence/widgets/app_bar.dart';

class ReturnPolicy extends StatelessWidget{
  const ReturnPolicy({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: const AppAppBar(title: 'Política de Devoluciones',),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Política de Cambios y Devoluciones',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 4,),
              Text(
                'Soulence – Lummessence S.C. \n En Soulence, cada vela aromática está diseñada para acompañarte con bienestar, intención y cuidado. Si por alguna razón tu experiencia no fue la esperada debido a un mal funcionamiento del producto, te ofrecemos el siguiente método de cambio o reembolso ',
                style: TextStyle(
                  fontWeight: FontWeight.normal
                ),
              ),
              SizedBox(height: 4,),
              Text(
                'Plazo para solicitar cambios o devoluciones',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 4,),
              Text(
                'Puedes solicitar un cambio o devolución dentro de los 7 días naturales posteriores a la recepción del producto. \n En caso de productos defectuosos, dañados o incorrectos, el plazo se extiende a 15 días naturales.',
                style: TextStyle(
                  fontWeight: FontWeight.normal
                ),
              ),
              SizedBox(height: 4,),
              Text(
                'Condiciones del producto',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 4,),
              Text(
                'El producto no debe estar usado y el empaque debe estar en condiciones óptimas. \nDebe incluir la tarjeta con el código intacto (sin rayaduras que muestren que el código fue canjeado). \n No aplicar a productos personalizados, usados o que hayan sido expuestos a calor o humedad.',
                style: TextStyle(
                  fontWeight: FontWeight.normal
                ),
              ),
              SizedBox(height: 4,),
              Text(
                'Cambios',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 4,),
              Text(
                'Puedes solicitar un cambio por otro aroma, presentación o producto de igual valor.',
                style: TextStyle(
                  fontWeight: FontWeight.normal
                ),
              ),
              SizedBox(height: 4,),
              Text(
                'Devoluciones y reembolsos',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4,),
              Text(
                'Una vez recibido y verificado que el producto cuente con la tarjeta intacta, se procesará el reembolso en un plazo de 5 a 10 días hábiles. \nEl reembolso se realizará mediante el mismo método de pago utilizado en la compra.\nPara aquellos casos de promociones o descuentos, se reembolsará el monto pagado, no el valor original del producto.',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 4,),
              Text(
                'Información requerida',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4,),
              Text(
                'Número de pedido\nMotivo del cambio o devolución\nFotografías del producto (si aplica)',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                'Medios de contacto:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4,),
              Text(
                'contactosoulence@gmail.com\n+52 (771) 123 4567\nNuestro equipo te responderá en un plazo máximo de 48 horas hábiles con los pasos a seguir.',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              ),
              
        
            ],
          ),
        ),
      ),
    );
  }
}