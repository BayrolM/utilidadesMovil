import 'package:flutter/material.dart';
import '../main.dart';

class AnalizadorScreen extends StatefulWidget {
  final Function(AppState) onNavigate;

  const AnalizadorScreen({super.key, required this.onNavigate});

  @override
  State<AnalizadorScreen> createState() => _AnalizadorScreenState();
}

class _AnalizadorScreenState extends State<AnalizadorScreen> {
  final controller = TextEditingController();
  String resultado = "";

  void analizar() {
    String texto = controller.text;
    String vocales = 'aeiouáéíóú';
    String consonantes = 'bcdfghjklmnpqrstvwxyz';

    int contadorVocales = 0;
    int contadorConsonantes = 0;
    String palabraMasLarga = '';

    List<String> palabras = texto.toLowerCase().split(' ');
    int totalPalabras = palabras.length;

    for (var p in palabras) {
      if (p.length > palabraMasLarga.length) {
        palabraMasLarga = p;
      }
    }

    for (int i = 0; i < texto.length; i++) {
      String c = texto[i].toLowerCase();
      if (vocales.contains(c)) contadorVocales++;
      if (consonantes.contains(c)) contadorConsonantes++;
    }

    setState(() {
      resultado =
          '''
Total de palabras: $totalPalabras
Palabra más larga: $palabraMasLarga
Total de letras: ${contadorVocales + contadorConsonantes}
Vocales: $contadorVocales
Consonantes: $contadorConsonantes
''';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Analizador de Texto")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              maxLines: 3,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Ingrese un texto",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: analizar, child: const Text("Analizar")),
            const SizedBox(height: 20),
            Text(resultado),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => widget.onNavigate(AppState.principal),
              child: const Text("Volver al inicio"),
            ),
          ],
        ),
      ),
    );
  }
}
