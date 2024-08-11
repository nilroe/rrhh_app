import 'package:flutter/material.dart';
import 'package:rrhh_catoosa/api/api_service.dart';

class FichajesScreen extends StatefulWidget {
  final String userId;

  FichajesScreen({required this.userId});

  @override
  _FichajesScreenState createState() => _FichajesScreenState();
}

class _FichajesScreenState extends State<FichajesScreen> {
  final ApiService apiService = ApiService();
  List<dynamic> _fichajes = [];

  @override
  void initState() {
    super.initState();
    _loadFichajes();
  }

  void _loadFichajes() async {
    try {
      final fichajes = await apiService.getFichajes(widget.userId);
      setState(() {
        _fichajes = fichajes;
      });
    } catch (e) {
      print('Failed to load fichajes: $e');
    }
  }

  void _registrarFichaje() async {
    try {
      await apiService.registrarFichaje(widget.userId, DateTime.now());
      _loadFichajes();  // Recargar la lista después de registrar
    } catch (e) {
      print('Failed to register fichaje: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fichajes'),
      ),
      body: ListView.builder(
        itemCount: _fichajes.length,
        itemBuilder: (context, index) {
          final fichaje = _fichajes[index];
          return ListTile(
            title: Text('Fichaje ID: ${fichaje['id']}'),
            subtitle: Text('Fecha y Hora: ${fichaje['fecha_hora']}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _registrarFichaje,
        child: Icon(Icons.add),
      ),
    );
  }
}
