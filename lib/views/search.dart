import 'package:flutter/material.dart';
import 'package:uts_pm2/models/blog.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Blog> displayedBlogs = Blog.blogs; // List blog yang di filter
  String searchQuery = '';

  // Mencari sesuai judul
  void filterBlogs(String query) {
    setState(() {
      searchQuery = query;
      displayedBlogs = Blog.blogs
          .where((blog) =>
              blog.title != null &&
              blog.title!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cari Blog'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: filterBlogs, // Ketika text field berubah, jalankan filter blog
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Cari sesuai judul...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          // Listview untuk list blog
          Expanded(
            child: ListView.builder(
              itemCount: displayedBlogs.length,
              itemBuilder: (context, index) {
                final blog = displayedBlogs[index];
                return ListTile(
                  title: Text(blog.title ?? '[Tidak ada Judul]'),
                  subtitle: Text(
                    blog.body ?? '[Tidak ada konten]',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}