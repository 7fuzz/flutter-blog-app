import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uts_pm2/models/user.dart';
import 'package:uts_pm2/views/dashboard.dart';
import 'package:uts_pm2/views/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _login() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    // Jika username atau password kosong, form akan memberitahu
    if (!_formKey.currentState!.validate()) return;

    final user = User.authenticate(username, password);

    // Jika username atau password salah akan menampilkan pesan error
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Username atau password salah'),
          duration: Duration(seconds: 2),
        )
      );
      return;
    }
    
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', user.username);

    // Masuk ke halaman dashboard
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => DashboardScreen(user: user),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        automaticallyImplyLeading: false
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
                validator: (value) => value!.isEmpty ? 'Masukan username' : null,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) => value!.isEmpty ? 'Masukan Password' : null,
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                    onPressed: _login,
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 20,),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Belum punya akun?',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                    onPressed: () {
                      Navigator.push(
                        context,
                         MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                        )
                      );
                    },
                    child: const Text('Daftar'),
                  ),
                ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}