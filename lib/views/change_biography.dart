import 'package:flutter/material.dart';

import '../models/biography.dart';

class ChangeBiographyScreen extends StatefulWidget {
  final Biography biography;

  const ChangeBiographyScreen({
    super.key,
    required this.biography,
  });

  @override
  State<ChangeBiographyScreen> createState() => _ChangeBiographyScreenState();
}

class _ChangeBiographyScreenState extends State<ChangeBiographyScreen> {
  final _formKey = GlobalKey<FormState>();
  late String bio;
  late String profilePicture;
  late String website;
  late String location;
  late String aboutMe;

  @override
  void initState() {
    super.initState();
    bio = widget.biography.bio ?? '';
    website = widget.biography.website ?? '';
    location = widget.biography.location ?? '';
    aboutMe = widget.biography.aboutMe ?? '';
  }

  void saveBiography() {
    var formKey = _formKey;
    // Jika validasi form gagal, tidak lanjut
    if (!formKey.currentState!.validate()) {
      return;
    }

    // Update biography
    setState(() {
      // Jika kosong akan menjadi null
      widget.biography.bio = bio.isEmpty ? null : bio;
      widget.biography.website = website.isEmpty ? null : website;
      widget.biography.location = location.isEmpty ? null : location;
      widget.biography.aboutMe = aboutMe.isEmpty ? null : aboutMe;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Biography Berhasil diupdate!')),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Biography'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: saveBiography,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Center(child:
                Text('Belum bisa mengganti foto profil',style: TextStyle(color: Colors.red),)
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: bio,
                onChanged: (value) => bio = value,
                decoration: const InputDecoration(labelText: 'Bio'),
                validator: (value) => value != null && value.length > 100
                    ? 'Bio tidak boleh lebih dari 100 karakter'
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: website,
                onChanged: (value) => website = value,
                decoration: const InputDecoration(labelText: 'Website'),
                validator: (value) =>
                    value != null && value.isNotEmpty && !Uri.tryParse(value)!.isAbsolute
                        ? 'Masukan URL yang valid'
                        : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: location,
                onChanged: (value) => location = value,
                decoration: const InputDecoration(labelText: 'Lokasi'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: aboutMe,
                onChanged: (value) => aboutMe = value,
                decoration: const InputDecoration(
                  labelText: 'Tentang Saya',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                ),
                maxLines: 8, // Maksimal baris
              ),
            ],
          ),
        ),
      ),
    );
  }
}
