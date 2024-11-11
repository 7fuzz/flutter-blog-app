import 'dart:math';

import 'package:uts_pm2/models/user.dart';

class Blog {
  // Semua variable bisa null, kecuali id
  final String id;
  String? title; // judul
  String? body; // isi blog
  DateTime? published; // tanggal rilis blog
  User? writer; // Penulis

  
  Blog({
    required this.id,
    this.title,
    this.body,
    this.published,
    this.writer
  });
  
  // membuat id random
  static String _generateRandomId() {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    String id;
    
    id = String.fromCharCodes(
      Iterable.generate(8, (_) => characters.codeUnitAt(random.nextInt(characters.length))),
    );

    return id;
  }

  // List blog pengganti database
  List<Blog> blogs = [
    Blog(
      id: _generateRandomId(),
      title: 'UTB: Teknik Informatika',
      body: 'Bersama Teknik Informatika Sekolah Tinggi Teknologi Bandung menghadirkan generasi yang melek terhadap teknologi dan berani berinovasi kreatif sehingga lahirlah generasi yang “Mampu Menganalisa, Merancang, dan Membangun App & Perangkat Komputer, paham terhadap Information Tech Development, Comp and Network Security, Robotics and Embedded System',
      published: DateTime(2024, 4, 23),
      writer: User.getUser('admin')
    ),
    Blog(
      id: _generateRandomId(),
      title: 'Mengapa Teknik Informatika Menawarkan Peluang Karir yang Menjanjikan di Era Digital? ',
      body: 'Di tengah perkembangan pesat teknologi informasi, program studi Teknik Informatika menjadi salah satu jurusan yang semakin diminati oleh calon mahasiswa yang ingin berkarir di bidang teknologi. Di Universitas Teknologi Bandung (UTB), program studi ini dirancang untuk memberikan pengetahuan dan keterampilan yang dibutuhkan untuk memahami dan memecahkan berbagai tantangan di dunia teknologi informasi, komputasi, dan pengembangan perangkat lunak. Lulusan program studi ini nantinya akan menyandang gelar Sarjana Komputer (S.Kom), sebuah gelar yang diakui secara nasional dan internasional, yang membuka berbagai peluang karir di industri teknologi yang berkembang pesat.',
      published: DateTime(2024, 6, 22),
      writer: User.getUser('staff')
    ),
    Blog(
      id: _generateRandomId(),
      title: 'Rice Disease: Solusi Teknologi dari Mahasiswa UTB untuk Petani Dalam Meningkatkan Ketahanan Pangan',
      body: 'Kevin Christianto, mahasiswa Universitas Teknologi Bandung (UTB), berhasil ciptakan sebuah aplikasi berbasis Android bernama Rice Disease Detection. Aplikasi ini bertujuan membantu petani padi dalam mendeteksi penyakit pada tanaman padi serta memberikan panduan cara penanganannya. Inovasi ini hadir sebagai jawaban atas tantangan yang sering dihadapi para petani, yaitu kesulitan dalam mengenali penyakit yang menyerang tanaman padi secara dini.',
      published: DateTime(2024, 7, 2),
      writer: User.getUser('mahasiswa')
    ),
    Blog(
      id: _generateRandomId(),
      title: 'Rahasia Menggunakan Seele di Honkai Star Rail untuk Serangan Mematikan!',
      body: 'Seele adalah karakter 5-star dengan kemampuan serangan Quantum yang mematikan. Untuk memaksimalkan potensinya, manfaatkan Skill "Night Shine" untuk meningkatkan serangan dan Ultimate "Starfall" yang memberikan damage besar serta serangan lanjutan. Fokuskan pada relik yang meningkatkan Crit Rate dan Crit Damage, serta gunakan karakter pendukung yang bisa meningkatkan crit damage dan melakukan menambah kecepatan Seele seperti Bronya atau Sparkle, agar Seele bisa memberikan damage maksimal di setiap pertarungan!',
      published: DateTime(2024, 8, 13),
      writer: User.getUser('yusril')
    ),
  ];

}