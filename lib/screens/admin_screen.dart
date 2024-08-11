import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Administrador'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text('Filtrar Fichajes'),
            SizedBox(height: 20),
            // Filtros de empresa, usuario, rango de fechas.
            TextField(
              decoration: InputDecoration(labelText: 'Empresa'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Usuario'),
            ),
            // Implementa un selector de rango de fechas aquí.
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aquí deberías implementar la lógica para filtrar y mostrar los fichajes.
              },
              child: Text('Buscar'),
            ),
            SizedBox(height: 40),
            Expanded(
              child: ListView.builder(
                itemCount: 20, // Debería ser el número de fichajes encontrados.
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Fichaje de Usuario X'),
                    subtitle: Text('Fecha y Hora'),
                    trailing: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        // Editar fichaje.
                      },
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
