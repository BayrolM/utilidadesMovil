import 'package:flutter/material.dart';
import '../main.dart';

class PasswordScreen extends StatefulWidget {
  final Function(AppState) onNavigate;

  const PasswordScreen({super.key, required this.onNavigate});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final _passwordController = TextEditingController();
  String _mensaje = '';
  Color _mensajeColor = Colors.red;

  bool _validarContrasena(String contrasena) {
    final RegExp regex = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );
    return regex.hasMatch(contrasena);
  }

  void validationPassword() {
    final password = _passwordController.text;

    if (password.isEmpty) {
      setState(() {
        _mensaje = 'La contraseña no puede estar vacía';
        _mensajeColor = Colors.red;
      });
      return;
    }

    if (_validarContrasena(password)) {
      setState(() {
        _mensaje = 'Contraseña válida';
        _mensajeColor = Colors.green;
      });
    } else {
      setState(() {
        _mensaje =
            'La contraseña debe tener 8 caracteres, \nuna mayúscula, minúscula, número y carácter especial';
        _mensajeColor = Colors.red;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Validar Contraseña'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),

            const Text(
              'Ingrese una contraseña:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Escribe tu contraseña",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: validationPassword,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Validar', style: TextStyle(fontSize: 16)),
            ),

            const SizedBox(height: 20),

            Text(
              _mensaje,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: _mensajeColor,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Spacer(),

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

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
