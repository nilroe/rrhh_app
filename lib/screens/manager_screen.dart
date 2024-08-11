import 'package:flutter/material.dart';

class ManagerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerente'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Aprobar Fichajes'),
            SizedBox(height: 20),
            // Lista de fichajes pendientes de aprobación.
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Debería ser el número de fichajes pendientes.
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Fichaje de Usuario X'),
                    subtitle: Text('Fecha y Hora'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.check),
                          color: Colors.green,
                          onPressed: () {
                            // Aprobar fichaje.
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.close),
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
