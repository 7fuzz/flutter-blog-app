import 'package:bcrypt/bcrypt.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class ChangePasswordScreen extends StatefulWidget {
  final User user;

  const ChangePasswordScreen({super.key, required this.user});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  late String currentPassword;
  late String newPassword;
  late String confirmPassword;

  void updatePassword() {
    var formKey = _formKey;
    // Jika validasi form gagal, tidak lanjut
    if (!formKey.currentState!.validate()) {
      return;
    }

    // Jika password lama salah, tampilkan pesan password lama salah
    if (!BCrypt.checkpw(currentPassword, widget.user.password)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password Lama Salah')),
      );
      return;
    }

    // Jika password baru dan konfirmasi password berbeda, tampilkan pesan password tidak sama
    if (newPassword != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password dan konfirmasi password tidak sama')),
      );
      return;
    }

    // Update password user
    setState(() {
      widget.user.password = BCrypt.hashpw(newPassword, BCrypt.gensalt());
    });

    // Tampilkan snackbar password diubah
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password berhasil diubah!')),
    );

    // Kembali ke menu sebelumnya
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ganti Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password lama'),
                onChanged: (value) => currentPassword = value,
                validator: (value) => value == null || value.isEmpty
                    ? 'Masukan password lama'
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password baru'),
                onChanged: (value) => newPassword = value,
                validator: (value) =>
                    value != null && value.length >= 6 ? null : 'Password minimal 6 karakter', // Password minimal 6 karakter
              ),
              const SizedBox(height: 16),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Konfirmasi password'),
                onChanged: (value) => confirmPassword = value,
                validator: (value) =>
                    value != null && value.isNotEmpty ? null : 'Masukan konfirmasi password baru',
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: updatePassword,
                child: const Text('Ganti Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
