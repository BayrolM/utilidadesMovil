import 'package:flutter/material.dart';
import '../main.dart';
import '../models/imc.dart';

class ImcScreen extends StatefulWidget {
  final Function(AppState) onNavigate;

  const ImcScreen({super.key, required this.onNavigate});

  @override
  State<ImcScreen> createState() => _ImcScreenState();
}

class _ImcScreenState extends State<ImcScreen> {
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();

  String _resultado = '';

  void calcularIMC() {
    final peso = double.tryParse(pesoController.text);
    final altura = double.tryParse(alturaController.text);

    if (peso == null || altura == null) {
      setState(() => _resultado = 'Valores inválidos');
      return;
    }

    final calculadora = ImcCalculator(altura: altura, peso: peso);
    final imc = calculadora.calcularImc();
    final interpretacion = calculadora.respuestaImc();

    setState(() {
      _resultado =
          'IMC: ${imc.toStringAsFixed(2)}\nInterpretación: $interpretacion';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Cálculo IMC"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Peso (kg)",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.indigo.shade700,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Ej: 70",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "Altura (m)",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.indigo.shade700,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Ej: 1.75",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: calcularIMC,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Calcular IMC", style: TextStyle(fontSize: 16)),
            ),

            const SizedBox(height: 20),

            Text(
              _resultado,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: () => widget.onNavigate(AppState.principal),
              icon: const Icon(Icons.home),
              label: const Text("Volver al Inicio"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
