import 'package:flutter/material.dart';
import '../pages/home.dart'; // Mengarah ke file home.dart di dalam folder pages

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  void initState() {
    super.initState();
    // Otomatis pindah ke halaman Home setelah 3 detik
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GestureDetector(
          // Kalau logo diklik, langsung pindah juga tanpa menunggu timer
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
          child: SizedBox(
            width: 280,
            height: 280,
            child: Image.asset(
              'assets/lunar_knowledge.png',
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.image, size: 60, color: Colors.grey);
              },
            ),
          ),
        ),
      ),
    );
  }
}
