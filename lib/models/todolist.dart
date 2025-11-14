class Task {
  String titulo;
  String descripcion;
  bool completada;

  Task({
    required this.titulo,
    required this.descripcion,
    this.completada = false,
  });

  @override
  String toString() {
    final estado = completada ? '✅' : '';
    return '[$estado] $titulo: $descripcion';
  }
}

class Todolist {
  final List<Task> tareas = [];

  void addTask(String titulo, String descripcion) {
    tareas.add(Task(titulo: titulo, descripcion: descripcion));
  }

  void deleteTask(String titulo) {
    tareas.removeWhere((t) => t.titulo == titulo);
  }

  void completeTask(int index) {
    if (index >= 0 && index < tareas.length) {
      tareas[index].completada = true;
    }
  }

  List<String> showTask() {
    if (tareas.isEmpty) {
      return ['No hay tareas agregadas.'];
    }

    return List.generate(tareas.length, (i) => '$i. ${tareas[i]}');
  }
}
