import 'package:flutter/material.dart';
import 'package:uts_pm2/views/login.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Perform logout action (e.g., clear session, etc.)
            // Navigate back to the login screen or home screen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
          child: const Text('Logout'),
        ),
      )
    );
  }
}
