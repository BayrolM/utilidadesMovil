import 'package:flutter/material.dart';
import '../main.dart';
import '../models/conversor_temperatura.dart';

class TemperatureScreen extends StatefulWidget {
  final Function(AppState) onNavigate;

  const TemperatureScreen({super.key, required this.onNavigate});

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  final TextEditingController _controller = TextEditingController();
  UnidadTemperatura _origen = UnidadTemperatura.celsius;
  UnidadTemperatura _destino = UnidadTemperatura.fahrenheit;
  String _resultado = '';

  void _convertir() {
    final texto = _controller.text.trim();
    if (texto.isEmpty) {
      setState(() => _resultado = 'Por favor ingresa un valor.');
      return;
    }

    final valor = double.tryParse(texto.replaceAll(',', '.'));
    if (valor == null) {
      setState(() => _resultado = 'Valor inválido.');
      return;
    }

    final resultadoFinal = _origen.convertir(valor, _destino);
    setState(() {
      _resultado =
          '${valor.toStringAsFixed(2)} ${_origen.texto()} → ${resultadoFinal.toStringAsFixed(2)} ${_destino.texto()}';
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  DropdownMenuItem<UnidadTemperatura> _menuItem(UnidadTemperatura u) {
    return DropdownMenuItem(value: u, child: Text(u.texto()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversor de Temperatura'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Align(alignment: Alignment.centerLeft, child: Text('Valor:')),
            const SizedBox(height: 6),
            TextField(
              controller: _controller,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                hintText: 'Ingrese la temperatura',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                const Text('De:'),
                const SizedBox(width: 12),
                DropdownButton<UnidadTemperatura>(
                  value: _origen,
                  items: UnidadTemperatura.values.map(_menuItem).toList(),
                  onChanged: (v) {
                    if (v == null) return;
                    setState(() {
                      _origen = v;

                      if (_origen == _destino) {
                        _destino = UnidadTemperatura.values.firstWhere(
                          (e) => e != _origen,
                        );
                      }
                    });
                  },
                ),
                const Spacer(),
                const Text('A:'),
                const SizedBox(width: 12),
                DropdownButton<UnidadTemperatura>(
                  value: _destino,
                  items: UnidadTemperatura.values.map(_menuItem).toList(),
                  onChanged: (v) {
                    if (v == null) return;
                    setState(() {
                      _destino = v;
                      if (_origen == _destino) {
                        _origen = UnidadTemperatura.values.firstWhere(
                          (e) => e != _destino,
                        );
                      }
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: _convertir,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(48),
              ),
              child: const Text('Convertir'),
            ),

            const SizedBox(height: 24),

            Text(
              _resultado,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),

            const Spacer(),

            ElevatedButton.icon(
              onPressed: () => widget.onNavigate(AppState.principal),
              label: const Text('Volver al inicio'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade800,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(48),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
