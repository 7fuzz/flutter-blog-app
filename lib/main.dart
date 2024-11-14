import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uts_pm2/views/splash.dart';

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
        textTheme: GoogleFonts.averiaSansLibreTextTheme(),
        // ubah default style appbar
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(142, 119, 221, 119),
          titleTextStyle: GoogleFonts.averiaSansLibre(
            fontSize: 24,
            color: Colors.white
          ),
          centerTitle: true // text ditengah
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.lightGreen,
          unselectedItemColor: Colors.black,
          selectedLabelStyle: TextStyle(color: Colors.lightGreenAccent),
          unselectedLabelStyle: TextStyle(color: Colors.black54),
        )
        ),
      home: const SplashScreen(), // Splashscreen yang pertama dibuka
    );
  }
}
