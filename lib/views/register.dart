import 'package:flutter/material.dart';
import 'package:bcrypt/bcrypt.dart';
import 'package:uts_pm2/models/biography.dart';

import '../models/user.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  // username password wajib, nama email phone opsional
  String username = '', password = '', confirmPassword = '';
  String? name, email, phone;


  void _register() {
    var formKey = _formKey;
    if (!formKey.currentState!.validate()) {
      return;
    }

    // hash password
    final hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
    // Buat user sesuaid dengan form dan biography kosong
    final newUser = User(
      username: username,
      password: hashedPassword,
      name: name,
      email: email,
      phone: phone,
    );
    final Biography biography = Biography(username: username);

    // tambah biography dan user ke list
    User.users.add(newUser);
    Biography.biographies.add(biography);

    // Tampilkan pesan sukses
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Berhasil daftar! Silahkan login')),
    );

    // balik ke login
    Navigator.pop(context);
  }

  // Pengecekan username terdaftar atau tidak
  bool usernameTaken(String username) {
    if (User.getUser(username) == null) return false;
    return true;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Username
              TextFormField(
                decoration: const InputDecoration(labelText: 'Username'),
                onChanged: (value) => username = value,
                validator: (value) {
                  if (value == null || value.isEmpty) { // Username harus isi
                    return 'Please enter a username';
                  }
                  if (usernameTaken(value)) return 'Username sudah terdaftar';
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Password
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'), 
                obscureText: true,
                onChanged: (value) => password = value,
                validator: (value) {
                  if (value == null || value.isEmpty) { // Password harus diisi
                    return 'Please enter a password';
                  }
                  if (value.length < 6) { // password minimal 6 karakter
                    return 'Password should be at least 6 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Konfirmasi Password
              TextFormField(
                decoration: const InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
                onChanged: (value) => confirmPassword = value,
                validator: (value) {
                  if (value != password) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Nama
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                onChanged: (value) => name = value,
              ),
              const SizedBox(height: 16),

              // Email
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                onChanged: (value) => email = value.isEmpty ? null : value,
                validator: (value) {
                  // Boleh kosong, tapi jika isi harus valid
                  if (value == null || value.isEmpty) return null;
                  return value.contains('@') ? null : 'Masukan email yang valid';
                },
              ),
              const SizedBox(height: 16),

              // Nomor telepon 
              TextFormField(
                decoration: const InputDecoration(labelText: 'Phone'),
                onChanged: (value) => phone = value.isEmpty ? null : value,
                validator: (value) {
                  // Boleh kosong, tapi jika isi harus valid
                  if (value == null || value.isEmpty) return null;
                  return value.length >= 9 ? null : 'Masukan nomor yang valid';
                },
              ),
              const SizedBox(height: 16),

              // Tombol daftar 
              ElevatedButton(
                onPressed: _register,
                child: const Text('Daftar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
