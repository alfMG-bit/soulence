import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:soulence/main.dart';
import 'package:soulence/widgets/app_bar.dart';
import 'package:soulence/widgets/app_drawer.dart';

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: "Contactos"),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Trauma emocional
            Specialities(
              title: "Trauma emocional",
              specialists: [
                Specialist(
                  name: "Ps. Eduardo Vidal",
                  subspecialties: ["Cognitivo-Conductual", "Jovenes", "Adultos", "Adolescentes"],
                  description:
                      "Mi enfoque como psicólogo es integral, ya que me adapto a las necesidades de cada paciente y a los objetivos que se plantean en el proceso terapéutico. Busco brindar un acompañamiento flexible y personalizado.",
                ),
                Specialist(
                  name: "Ps. Javier Navia",
                  subspecialties: ["Sistémico Breve", "Jóvenes", "Adultos"],
                  description:
                      "Con el enfoque sistémico-narrativo nos enfocaremos en encontrar fortalezas y recursos en las experiencias complejas que estés viviendo.",
                ),
                Specialist(
                  name: "Ps. Cristian Castro",
                  subspecialties: ["Cristian Castro", "Jóvenes", "Adultos", "Adolescentes"],
                  description: "Mi trabajo se centra en el aquí y ahora, abordando las emociones, pensamientos y comportamientos que interfieren en tu calidad de vida.",
                ),
                Specialist(
                  name: "Ps. Luz Condori",
                  subspecialties: ["Integratio", "Jóvenes", "Adultos", "Parejas"],
                  description: "Psicóloga con enfoque Integrativo, afirmativo y de género. Con experiencia en la evaluación y tratamiento de trastornos mentales y emocionales, consejería sexual.",
                ),
              ],
            ),

            SizedBox(height: 24,),

            Specialities(
              title: "Pensamientos intrusivos", 
              specialists: [
                Specialist(
                  name: "Ps. Macarena García", 
                  subspecialties: ["Sistémico Breve", "Adultos", "Parejas"], 
                  description: "Facilitadora de un espacio terapéutico en modalidad online y presencial en Viña del Mar a adultos y parejas."
                ),
                Specialist(
                  name: "Ps. Catalina Acevedo", 
                  subspecialties: ["Sistémico Breve", "Adultos"], 
                  description: "Psicóloga con enfoque sistémico breve, centrada en brindar apoyo y búsqueda de soluciones según cada consultante."
                ),
              ]
            ),
            SizedBox(height: 24),

            // Estrés
            Specialities(
              title: "Estrés",
              specialists: [
                Specialist(
                  name: "Ps. Catalina Acevedo", 
                  subspecialties: ["Sistémico Breve", "Adultos"], 
                  description: "Psicóloga con enfoque sistémico breve, centrada en brindar apoyo y búsqueda de soluciones según cada consultante."
                ),
                Specialist(
                  name: "Ps. Luz Condori",
                  subspecialties: ["Integratio", "Jóvenes", "Adultos", "Parejas"],
                  description: "Psicóloga con enfoque Integrativo, afirmativo y de género. Con experiencia en la evaluación y tratamiento de trastornos mentales y emocionales, consejería sexual.",
                ),
                Specialist(
                  name: "Ps. Javier Navia",
                  subspecialties: ["Sistémico Breve", "Jóvenes", "Adultos"],
                  description: "Con el enfoque sistémico-narrativo nos enfocaremos en encontrar fortalezas y recursos en las experiencias complejas.",
                ),
                Specialist(
                  name: "Ps. Arturo Palma",
                  subspecialties: ["Humanista", "Adultos", "Adolescentes", "Parejas"],
                  description: "Soy Psicólogo clínico con orientación humanista considerando al ser humano como pieza fundamental en su vida.",
                ),
                Specialist(
                  name: "Ps. Eduardo Vidal",
                  subspecialties: ["Cognitivo-Conductual", "Jovenes", "Adultos", "Adolescentes"],
                  description:
                      "Mi enfoque como psicólogo es integral, ya que me adapto a las necesidades de cada paciente y a los objetivos que se plantean en el proceso terapéutico. Busco brindar un acompañamiento flexible y personalizado.",
                ),
              ],
            ),
            SizedBox(height: 24),

            // Ansiedad
            Specialities(
              title: "Ansiedad",
              specialists: [
                Specialist(
                  name: "Ps. Catalina Acevedo", 
                  subspecialties: ["Sistémico Breve", "Adultos"], 
                  description: "Psicóloga con enfoque sistémico breve, centrada en brindar apoyo y búsqueda de soluciones según cada consultante."
                ),
                Specialist(
                  name: "Ps. Eduardo Vidal",
                  subspecialties: ["Cognitivo-Conductual", "Jovenes", "Adultos", "Adolescentes"],
                  description:
                      "Mi enfoque como psicólogo es integral, ya que me adapto a las necesidades de cada paciente y a los objetivos que se plantean en el proceso terapéutico. Busco brindar un acompañamiento flexible y personalizado.",
                ),
                Specialist(
                  name: "Ps. Cristian Castro",
                  subspecialties: ["Cristian Castro", "Jóvenes", "Adultos", "Adolescentes"],
                  description: "Mi trabajo se centra en el aquí y ahora, abordando las emociones, pensamientos y comportamientos que interfieren en tu calidad de vida.",
                ),
                Specialist(
                  name: "Ps. Javier Navia",
                  subspecialties: ["Sistémico Breve", "Jóvenes", "Adultos"],
                  description: "Con el enfoque sistémico-narrativo nos enfocaremos en encontrar fortalezas y recursos en las experiencias complejas.",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Specialities extends StatelessWidget {
  final String title;
  final List<Specialist> specialists;

  const Specialities({
    super.key,
    required this.title,
    required this.specialists,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: AppColors.darkBrown,
            ),
          ),
        ),
        ...specialists.map((specialist) => SpecialistCard(specialist: specialist)),
      ],
    );
  }
}

class Specialist {
  final String name;
  final List<String> subspecialties;
  final String description;

  Specialist({
    required this.name,
    required this.subspecialties,
    required this.description,
  });
}

class SpecialistCard extends StatelessWidget {
  final Specialist specialist;

  const SpecialistCard({
    super.key,
    required this.specialist,
  });

  void _showAppointmentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(Symbols.person, color: AppColors.darkBrown),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  specialist.name,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "¿Qué tipo de cita deseas agendar?",
                textAlign: TextAlign.center,
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
                _showUrgentAppointmentConfirmation(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text(
                "Cita Urgente",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _showNormalAppointmentConfirmation(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.darkBrown,
              ),
              child: Text(
                "Agendar Cita",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showUrgentAppointmentConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(Icons.emergency, color: Colors.red, size: 32),
              SizedBox(width: 8),
              Text("Cita Urgente"),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Symbols.schedule,
                size: 64,
                color: Colors.red,
              ),
              SizedBox(height: 16),
              Text(
                "Alguno de nuestros especialistas se pondrá en contacto contigo en menos de 4 horas.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                "Estamos contigo.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkBrown,
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
                "Entendido",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showNormalAppointmentConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 32),
              SizedBox(width: 8),
              Text("Solicitud Enviada"),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Symbols.mail,
                size: 64,
                color: AppColors.darkBrown,
              ),
              SizedBox(height: 16),
              Text(
                "El especialista recibió tu petición.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "En unos momentos se te enviará la lista de horarios disponibles a tu correo electrónico.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
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
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2,
      child: InkWell(
        onTap: () => _showAppointmentDialog(context),
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Ícono de persona
              CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.lightBrown.withOpacity(0.3),
                child: Icon(
                  Symbols.person,
                  size: 32,
                  color: AppColors.darkBrown,
                ),
              ),
              SizedBox(width: 12),

              // Información del especialista
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nombre
                    Text(
                      specialist.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColors.darkBrown,
                      ),
                    ),
                    SizedBox(height: 4),

                    // Subespecialidades
                    Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: specialist.subspecialties
                          .map(
                            (sub) => Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.lightPink.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                sub,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: AppColors.darkBrown,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(height: 6),

                    // Descripción
                    Text(
                      specialist.description,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              // Ícono de flecha
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}