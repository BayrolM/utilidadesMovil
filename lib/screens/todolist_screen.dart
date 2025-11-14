import 'package:flutter/material.dart';
import '../main.dart';

class Task {
  String titulo;
  String descripcion;
  bool completada;

  Task({
    required this.titulo,
    required this.descripcion,
    this.completada = false,
  });
}

class TodoListScreen extends StatefulWidget {
  final Function(AppState) onNavigate;

  const TodoListScreen({super.key, required this.onNavigate});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<Task> tareas = [];
  final tituloCtrl = TextEditingController();
  final descCtrl = TextEditingController();

  void addTask() {
    setState(() {
      tareas.add(Task(titulo: tituloCtrl.text, descripcion: descCtrl.text));
    });
    tituloCtrl.clear();
    descCtrl.clear();
  }

  void deleteTask(int index) {
    setState(() {
      tareas.removeAt(index);
    });
  }

  void completeTask(int index) {
    setState(() {
      tareas[index].completada = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Todo List")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: tituloCtrl,
              decoration: const InputDecoration(
                labelText: "Título",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: descCtrl,
              decoration: const InputDecoration(
                labelText: "Descripción",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: addTask,
              child: const Text("Agregar tarea"),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: tareas.length,
                itemBuilder: (context, index) {
                  final t = tareas[index];
                  return ListTile(
                    leading: Checkbox(
                      value: t.completada,
                      onChanged: (_) => completeTask(index),
                    ),
                    title: Text(t.titulo),
                    subtitle: Text(t.descripcion),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => deleteTask(index),
                    ),
                  );
                },
              ),
            ),
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
