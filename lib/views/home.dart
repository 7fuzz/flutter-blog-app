import 'package:flutter/material.dart';
import '../models/user.dart';

class HomeScreen extends StatelessWidget {
  final User user;

  const HomeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false
      ),
      body: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Menampilkan informasi user yang login
          Text(
            'Selamat Datang, ${user.name ?? user.username}!',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          // Gridview untuk tombol
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(10),
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              _buildDashboardButton(
                icon: Icons.person,
                label: 'Profile',
                onPressed: () {},
              ),
              _buildDashboardButton(
                icon: Icons.settings,
                label: 'Setting',
                onPressed: () {},
              ),
              _buildDashboardButton(
                icon: Icons.article,
                label: 'My blog',
                onPressed: () {},
              ),
              _buildDashboardButton(
                icon: Icons.edit,
                label: 'Write blog',
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  // widget untuk membuat tombol
  Widget _buildDashboardButton({required IconData icon, required String label, required VoidCallback onPressed}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black.withOpacity(0.1), 
            ),
            padding: const EdgeInsets.all(12), 
            child: Icon(
              icon,
              size: 24,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
