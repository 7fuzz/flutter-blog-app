import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uts_pm2/views/login.dart';
import '../models/user.dart';

class HomeScreen extends StatefulWidget {
  final User user;

  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Menampilkan informasi user yang login
          Text(
            'Selamat Datang, ${widget.user.name ?? widget.user.username}!',
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
          const SizedBox(height: 30,),
          Align(
            alignment: Alignment.center,
            // tombol logout
            child: ElevatedButton(
              onPressed: () async {
                // menghapus data username yang sedang login
                final prefs = await SharedPreferences.getInstance();
                await prefs.remove('username');
  
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text('Logout'),
            ),
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
