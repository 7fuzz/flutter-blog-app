import 'package:flutter/material.dart';
import 'package:uts_pm2/models/blog.dart';
import 'package:uts_pm2/models/user.dart';

class DashboardScreen extends StatelessWidget {
  final User user;

  const DashboardScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Column(
        children: [
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
          
          const Divider(
            color: Colors.grey,
            thickness: 10,
            height: 10,
          ),
          // ListView untuk list blog
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: Blog.blogs.length,
              itemBuilder: (context, index) {
                final blog = Blog.blogs[index];
                
                // Memotong teks isi jadi satu baris
                final truncatedBody = (blog.body != null && blog.body!.length > 50)
                    ? '${blog.body!.substring(0, 47)}...'
                    : blog.body ?? 'Tidak ada isi'; // Jika body null

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Menampilkan banner gambar
                      if (blog.banner != null)
                        Image.asset(blog.banner!, fit: BoxFit.cover, width: double.infinity, height: 150),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              blog.title ?? 'Tidak ada judul', // Jika title null
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              // Waktu terbit sesuai dengan zona waktu
                              'Diterbitkan: ${blog.published?.toLocal().toString().split(' ')[0]}',
                              style: const TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Penulis: ${blog.writer?.name ?? 'Tidak ada penulis'}',
                              style: const TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              truncatedBody,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // widget untuk membuat tombol
  Widget _buildDashboardButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    }) {
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