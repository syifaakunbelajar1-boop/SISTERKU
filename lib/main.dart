import 'package:flutter/material.dart';
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
        primaryColor: const Color(0xFF493568),
      ),
      home: const SplashScreen(),
    );
  }
}

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
      backgroundColor: const Color(0xFFF6F6F8),
      body: SizedBox.expand(
        child: _pages[_currentIndex],
      ),
      // Custom Bottom Navigation Bar persis desain Canva
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.black38, width: 0.8),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 64,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  // Baris 5 Menu Navigasi
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildNavItem(Icons.home_outlined, 'Home', 0),
                      _buildNavItem(Icons.book_outlined, 'LMS', 1),
                      // Ruang kosong di tengah untuk tombol bulat Presensi
                      const SizedBox(width: 65),
                      _buildNavItem(Icons.list_alt_outlined, 'CBT', 3),
                      _buildNavItem(Icons.person_outline, 'Akun', 4),
                    ],
                  ),

                  // Tombol Bulat Presensi Menyembul di Tengah
                  Positioned(
                    top: -22,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentIndex = 2;
                        });
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 54,
                            height: 54,
                            decoration: BoxDecoration(
                              color: _currentIndex == 2
                                  ? const Color(0xFF493568)
                                  : const Color(
                                      0xFFA0648B), // Ungu cantik persis Canva
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 3),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.tag, // Ikon pagar/grid persis di Canva
                              color: Colors.white,
                              size: 26,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Presensi',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: _currentIndex == 2
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                              color: _currentIndex == 2
                                  ? const Color(0xFF493568)
                                  : Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Garis Hitam Gestur Bawah
            Container(
              width: 125,
              height: 4,
              margin: const EdgeInsets.only(bottom: 8, top: 2),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final bool isSelected = _currentIndex == index;
    final Color color = isSelected ? const Color(0xFF493568) : Colors.black54;

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
