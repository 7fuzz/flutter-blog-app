import 'package:flutter/material.dart';
import 'package:uts_pm2/models/biography.dart';
import 'package:uts_pm2/models/user.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.user,});
  final User user;
  
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {  
  Biography? biography;
  @override
  void initState() {
    super.initState();
    // Inisialiasi biografi
    biography = Biography.getBio(widget.user.username);
  }

  @override
  Widget build(BuildContext context) {
    // cek apakah biografi dan isinya null
    Biography? bioData = biography;
    String profilePic = bioData?.profilePicture ?? 'assets/profilepic/default.jpg';
    String name = widget.user.name ?? 'Tanpa nama';
    String email = widget.user.email ?? 'No email';
    String bio = bioData?.bio ?? '';
    String website = bioData?.website ?? 'No website';
    String location = bioData?.location ?? 'Earth';
    String aboutMe = bioData?.aboutMe ?? 'Empty~';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Set gambar profil
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(profilePic),
              ),
            ),
            const SizedBox(height: 16),
            
            // nama
            Center(
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
            // Bio
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  bio,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            // email
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Email'),
              subtitle: Text(email),
            ),
            // website
            ListTile(
              leading: const Icon(Icons.link),
              title: const Text('Website'),
              subtitle: Text(website),
            ),
            // lokasi
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('Location'),
              subtitle: Text(location),
            ),
            
            const SizedBox(height: 20),
            
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'About Me',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            
            // panel cerita about me/tentang saya
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(16.0), 
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6.0,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  aboutMe,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}