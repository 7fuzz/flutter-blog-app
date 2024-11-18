import 'package:flutter/material.dart';
import 'package:uts_pm2/views/changePassword.dart';

import '../models/user.dart';

class SettingScreen extends StatefulWidget {
  final User user;

  const SettingScreen({super.key, required this.user});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  late String email;
  late String phone;
  late String password;

  @override
  void initState() {
    super.initState();
    name = widget.user.name ?? '';
    email = widget.user.email ?? '';
    phone = widget.user.phone ?? '';
    password = widget.user.password;
  }

  void saveChanges() {
    var formKey = _formKey;
    // Jika validasi form gagal, tidak lanjut
    if (!formKey.currentState!.validate()) {
      return;
    }

    // Update nama, email, dan nomor telepon
    setState(() {
      widget.user.name = name;
      widget.user.email = email;
      widget.user.phone = phone;
    });

    // Snackbar informasi diupdate
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Perubahan tersimpan!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          // Icon simpan di pojok kanan atas
          IconButton(
            icon: const Icon(Icons.save, color: Colors.white,),
            onPressed: saveChanges,
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            ListTile(
              title: const Text('Nama'),
              subtitle: TextFormField(
                initialValue: name,
                onChanged: (value) => name = value,
                validator: (value) => value == null || value.isEmpty ? 'Nama tidak boleh kosong' : null,
                decoration: const InputDecoration(hintText: 'Masukan nama Anda'),
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text('Email'),
              subtitle: TextFormField(
                initialValue: email,
                onChanged: (value) => email = value,
                validator: (value) => value != null && value.contains('@') ? null : 'Masukan email yang valid',
                decoration: const InputDecoration(hintText: 'Masukan email Anda'),
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text('No Telepon'),
              subtitle: TextFormField(
                initialValue: phone,
                onChanged: (value) => phone = value,
                validator: (value) => value != null && value.length >= 9 ? null : 'Masukan nomor telepon yang valid',
                decoration: const InputDecoration(hintText: 'Masukan nomor telepon Anda'),
                keyboardType: TextInputType.phone,
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text('Ganti Password'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangePasswordScreen(user: widget.user),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
