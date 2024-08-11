import 'package:flutter/material.dart';

class NormalUserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuario Normal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Registrar Fichaje'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aquí deberías implementar la lógica para registrar el fichaje.
              },
              child: Text('Fichar Entrada'),
            ),
            ElevatedButton(
              onPressed: () {
                // Aquí deberías implementar la lógica para registrar la salida.
              },
              child: Text('Fichar Salida'),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Aquí deberías implementar la lógica para ver el historial de fichajes.
              },
              child: Text('Ver Historial de Fichajes'),
            ),
          ],
        ),
      ),
    );
  }
}
