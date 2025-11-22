import 'package:flutter/material.dart';

import 'screens/temperatura_screen.dart';
import 'screens/imc_screen.dart';
import 'screens/password_screen.dart';
import 'screens/todolist_screen.dart';
import 'screens/analizador_screen.dart';

void main() {
  runApp(const MyApp());
}


enum AppState { principal, temperatura, imc, password, todolist, analizador }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaginaPrincipal(),
    );
  }
}

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  AppState _estadoActual = AppState.principal;

  void _cambiarEstado(AppState nuevo) {
    setState(() {
      _estadoActual = nuevo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return switch (_estadoActual) {
      AppState.principal => _pantallaPrincipal(),
      AppState.temperatura => TemperatureScreen(onNavigate: _cambiarEstado),
      AppState.imc => ImcScreen(onNavigate: _cambiarEstado),
      AppState.password => PasswordScreen(onNavigate: _cambiarEstado),
      AppState.todolist => TodoListScreen(onNavigate: _cambiarEstado),
      AppState.analizador => AnalizadorScreen(onNavigate: _cambiarEstado),
    };
  }

  Widget _pantallaPrincipal() {
    return Scaffold(
      appBar: AppBar(title: const Text("Menú Principal"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Selecciona una herramienta",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

     
            _opcion(
              titulo: "Conversor de Temperatura",
              color: Colors.blue,
              onTap: () => _cambiarEstado(AppState.temperatura),
            ),

            _opcion(
              titulo: "Calcular IMC",
              color: Colors.green,
              onTap: () => _cambiarEstado(AppState.imc),
            ),

            _opcion(
              titulo: "Validar Contraseña",
              color: Colors.orange,
              onTap: () => _cambiarEstado(AppState.password),
            ),

            _opcion(
              titulo: "Lista de Tareas (TODO)",
              color: Colors.purple,
              onTap: () => _cambiarEstado(AppState.todolist),
            ),

            _opcion(
              titulo: "Analizador de Texto",
              color: Colors.teal,
              onTap: () => _cambiarEstado(AppState.analizador),
            ),
          ],
        ),
      ),
    );
  }


  Widget _opcion({
    required String titulo,
    required MaterialColor color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18),
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: color.shade100, // color suave
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          titulo,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: color.shade700,
          ),
        ),
      ),
    );
  }
}
