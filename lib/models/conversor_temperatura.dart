enum UnidadTemperatura {
  celsius,
  fahrenheit,
  kelvin;

  double convertir(double valor, UnidadTemperatura unidadDestino) {
    if (this == unidadDestino) {
      return valor;
    }

    double valorEnCelsius;

    switch (this) {
      case UnidadTemperatura.celsius:
        valorEnCelsius = valor;
        break;
      case UnidadTemperatura.fahrenheit:
        valorEnCelsius = (valor - 32) * 5 / 9;
        break;
      case UnidadTemperatura.kelvin:
        valorEnCelsius = valor - 273.15;
        break;
    }

    switch (unidadDestino) {
      case UnidadTemperatura.celsius:
        return valorEnCelsius;
      case UnidadTemperatura.fahrenheit:
        return (valorEnCelsius * 9 / 5) + 32;
      case UnidadTemperatura.kelvin:
        return valorEnCelsius + 273.15;
    }
  }

  String texto() {
    switch (this) {
      case UnidadTemperatura.celsius:
        return '°C';
      case UnidadTemperatura.fahrenheit:
        return '°F';
      case UnidadTemperatura.kelvin:
        return 'K';
    }
  }
}
