import 'package:flutter/material.dart';
// Ganti baris di bawah ini sesuai nama file aslimu (misal: splash_screen.dart atau second_screen.dart)
import 'package:sister/login/splash_screen.dart';
import 'package:sister/pages/akun.dart';
import 'package:sister/pages/cbt.dart';
import 'package:sister/pages/home.dart';
import 'package:sister/pages/lms.dart';
import 'package:sister/pages/presensi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SISTER',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      // Memanggil halaman login/splash buatanmu
      home: const SplashScreen(),
    );
  }
}

// Menu utama dengan navigasi bawah yang rapi, tidak dobel, dan melebar penuh di PC
class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const LmsScreen(),
    const PresensiScreen(),
    const CbtScreen(),
    const AkunScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SizedBox.expand(
          child: _pages[_currentIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined), label: 'LMS'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: 'Presensi'),
          BottomNavigationBarItem(icon: Icon(Icons.computer), label: 'CBT'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Akun'),
        ],
      ),
    );
  }
}
