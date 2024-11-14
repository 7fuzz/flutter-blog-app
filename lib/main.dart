import 'package:flutter/material.dart';
import 'package:uts_pm2/views/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Memanggil halaman login
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'SourGummy',  // Pakau custom font
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'SourGummy',
            fontSize: 17,
            fontWeight: FontWeight.normal,
          ),
          bodySmall: TextStyle(
            fontFamily: 'SourGummy',
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          headlineLarge: TextStyle(
            fontFamily: 'SourGummy',
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            fontFamily: 'SourGummy',
            fontSize: 20,
            fontStyle: FontStyle.italic,
          ),
          headlineSmall: TextStyle(
            fontFamily: 'SourGummy',
            fontSize: 18,
            fontStyle: FontStyle.italic,
          ),
        ),
        // ubah default style appbar
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(142, 119, 221, 119),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 24, fontFamily: 'SourGummy'),
          centerTitle: true // text ditengah
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.lightGreen,
          unselectedItemColor: Colors.black,
          selectedLabelStyle: TextStyle(color: Colors.lightGreenAccent),
          unselectedLabelStyle: TextStyle(color: Colors.black54),
        )
        ),
      home: const LoginScreen(),
    );
  }
}
