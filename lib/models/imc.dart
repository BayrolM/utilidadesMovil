import 'dart:math' as math;

class ImcCalculator {
  double _altura;
  double _peso;

  // Constructor
  ImcCalculator({required double altura, required double peso})
    : _altura = altura,
      _peso = peso;

  // Setters
  set altura(double value) => _altura = value;
  set peso(double value) => _peso = value;

  // Metodo para calcular.
  double calcularImc() {
    return _peso / math.pow(_altura, 2);
  }

  // Metodo para obtener respuesta.

  String respuestaImc() {
    double imc = calcularImc();
    if (imc <= 18.5) {
      return 'Bajo peso';
    } else if (imc <= 25) {
      return 'Peso normal';
    } else if (imc <= 30) {
      return 'Sobrepeso';
    } else {
      return 'Obesidad';
    }
  }

  @override
  String toString() =>
      '$ImcCalculator(altura: $_altura, peso: $_peso, imc: ${calcularImc().toStringAsFixed(2)})';
}
