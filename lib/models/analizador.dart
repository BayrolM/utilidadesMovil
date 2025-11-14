class AnalizadorTexto {
  final String texto;

  AnalizadorTexto({required this.texto});

  Map<String, dynamic> analizar() {
    Map<String, dynamic> resultados = {};

    String t = texto.toLowerCase();
    String vocales = 'aeiouáéíóú';
    String consonantes = 'bcdfghjklmnpqrstvwxyz';

    int contadorVocales = 0;
    int contadorConsonantes = 0;
    String palabraMasLarga = '';

    List<String> palabras = t.split(' ');
    resultados['total_palabras'] = palabras.length;

    for (var palabra in palabras) {
      if (palabra.length > palabraMasLarga.length) {
        palabraMasLarga = palabra;
      }
    }
    resultados['palabra_mas_larga'] = palabraMasLarga;

    for (int i = 0; i < t.length; i++) {
      String c = t[i];

      if (vocales.contains(c)) {
        contadorVocales++;
      } else if (consonantes.contains(c)) {
        contadorConsonantes++;
      }
    }

    resultados['total_vocales'] = contadorVocales;
    resultados['total_consonantes'] = contadorConsonantes;
    resultados['total_letras'] = contadorVocales + contadorConsonantes;

    return resultados;
  }
}
