import 'package:bcrypt/bcrypt.dart';

class User {
  // Data user
  final String username;
  String password;
  String? name;
  String? email;
  String? phone;

  // Inisialisasi user
  // Username dan password wajib ada, yang lainnya opsional
  User({
    required this.username,
    required this.password,
    this.name,
    this.email,
    this.phone,
  });

  // Buat list user sebagai pengganti database
  static List<User> users = [
    User(
      username: 'yusril',
      // Password di hash dengan BCrypt
      password: BCrypt.hashpw("123", BCrypt.gensalt()),
      name: 'Yusril Fauzi',
      email: 'yusril@utb.com',
      phone: '+628123456789'
      ),
    User(
      username: 'admin',
      password: BCrypt.hashpw("123", BCrypt.gensalt()),
      name: 'Admin UTB'
      ),
    User(
      username: 'staff',
      password: BCrypt.hashpw("123", BCrypt.gensalt()),
      name: 'Staff TIF'
      ),
    User(
      username: 'mahasiswa',
      password: BCrypt.hashpw("123", BCrypt.gensalt()),
      name: 'Mahasiswa'
      ),
  ];
  
  // Validasi user
  static User? authenticate(String username, String password) {
    for (var user in users) {
      if (user.username == username && BCrypt.checkpw(password, user.password)) {
        return user;
      }
    }
    return null;
  }
  
  // Cari user sesuai usename
  static User? getUser(String? username) {
    for (var user in users) {
      if (user.username == username) {
        return user;
      }
    }
    return null;
  }
}