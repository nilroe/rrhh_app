import 'package:flutter/material.dart';

class ManagerScreen extends StatelessWidget {
  const ManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Aprobar Fichajes'),
            const SizedBox(height: 20),
            // Lista de fichajes pendientes de aprobación.
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Debería ser el número de fichajes pendientes.
                itemBuilder: (context, index) {
                  return ListTile(
                    title: const Text('Fichaje de Usuario X'),
                    subtitle: const Text('Fecha y Hora'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.check),
                          color: Colors.green,
                          onPressed: () {
                            // Aprobar fichaje.
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          color: Colors.red,
                          onPressed: () {
                            // Rechazar fichaje.
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
