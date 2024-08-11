import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final String baseUrl = 'http://127.0.0.1:8000'; // Cambia a la IP y puerto de tu FastAPI

  // Guardar token en SharedPreferences
  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  // Obtener token desde SharedPreferences
  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  // Autenticación de usuario
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      // Guardar el token
      await _saveToken(responseData['access_token']);
      return responseData;
    } else {
      throw Exception('Failed to login');
    }
  }

  // Obtener fichajes para un usuario
  Future<List<dynamic>> getFichajes(String userId) async {
    final token = await _getToken();
    final response = await http.get(
      Uri.parse('$baseUrl/fichajes/$userId'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load fichajes');
    }
  }

  // Registrar un nuevo fichaje
  Future<void> registrarFichaje(String userId, DateTime fechaHora) async {
    final token = await _getToken();
    final response = await http.post(
      Uri.parse('$baseUrl/fichajes/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        'user_id': userId,
        'fecha_hora': fechaHora.toIso8601String(),
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to register fichaje');
    }
  }
}
