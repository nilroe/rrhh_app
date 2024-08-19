import 'package:flutter/material.dart';

class NormalUserScreen extends StatelessWidget {
  const NormalUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuario Normal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Registrar Fichaje'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aquí deberías implementar la lógica para registrar el fichaje.
              },
              child: const Text('Fichar Entrada'),
            ),
            ElevatedButton(
              onPressed: () {
                // Aquí deberías implementar la lógica para registrar la salida.
              },
              child: const Text('Fichar Salida'),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Aquí deberías implementar la lógica para ver el historial de fichajes.
              },
              child: const Text('Ver Historial de Fichajes'),
            ),
          ],
        ),
      ),
    );
  }
}
