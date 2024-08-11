import 'package:flutter/material.dart';
import 'package:rrhh_catoosa/api/api_service.dart';
import 'package:rrhh_catoosa/screens/fichajes_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final ApiService apiService = ApiService();

  void _login() async {
  try {
    final result = await apiService.login(
      _emailController.text,
      _passwordController.text,
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FichajesScreen(userId: result['user_id'])),
    );
  } catch (e) {
    print('Login failed: $e');
    // Mostrar un mensaje de error
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
