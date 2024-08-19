import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Administrador'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const Text('Filtrar Fichajes'),
            const SizedBox(height: 20),
            // Filtros de empresa, usuario, rango de fechas.
            const TextField(
              decoration: InputDecoration(labelText: 'Empresa'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Usuario'),
            ),
            // Implementa un selector de rango de fechas aquí.
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aquí deberías implementar la lógica para filtrar y mostrar los fichajes.
              },
              child: const Text('Buscar'),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: ListView.builder(
                itemCount: 20, // Debería ser el número de fichajes encontrados.
                itemBuilder: (context, index) {
                  return ListTile(
                    title: const Text('Fichaje de Usuario X'),
                    subtitle: const Text('Fecha y Hora'),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
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
