import 'package:flutter/material.dart';
import '../models/blog.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog List'),
        automaticallyImplyLeading: false
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: Blog.blogs.length, // Hitung jumlah blog yang ada
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
    
    );
  }
}