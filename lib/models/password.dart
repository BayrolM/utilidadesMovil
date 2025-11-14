bool validarContrasena(String contrasena) {
  final RegExp regex = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
  );
  return regex.hasMatch(contrasena);
}

class PasswordValidator {
  String? _password;
  // String _confirmPassword;

  PasswordValidator({required String password}) : _password = password;

  String? get password => _password;

  set password(String value) => _password = value;

  String validarPassword() {
    String? contrasena = _password;
    if (contrasena == null || contrasena.isEmpty) {
      throw Exception('La contraseña no puede ser nula.');
    }
    if (!validarContrasena(contrasena)) {
      throw Exception(
        'La contraseña debe incluir al menos 8 caracteres, una mayúscula, una minúscula, un número y un carácter especial.',
      );
    }
    return 'Contraseña válida';
  }
}
