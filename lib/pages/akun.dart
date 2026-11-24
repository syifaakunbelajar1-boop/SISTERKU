import 'package:flutter/material.dart';

class AkunScreen extends StatelessWidget {
  const AkunScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F8),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ================= HEADER UNGU (BERHENTI DI INFO KELAS/SEKOLAH) =================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: 48,
                left: 20,
                right: 20,
                bottom: 24,
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF493568),
                    Color(0xFF7B7EB0),
                  ],
                ),
              ),
              child: Column(
                children: [
                  // Foto Profil
                  Container(
                    width: 76,
                    height: 76,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                      image: const DecorationImage(
                        image: AssetImage('assets/pp.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Nama Siswa
                  const Text(
                    'Columbina Hypselenia',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  // Kelas & Sekolah
                  const Text(
                    'XI MIPA 1 | SMA Saint Peter\'s School',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            // ================= KONTEN UTAMA (DI LUAR HEADER UNGU) =================
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Kotak Statistik Kehadiran (Hadir, Sakit, Izin, Alpha) dengan Bingkai Hitam
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.black54, width: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatItem('0', 'Hadir'),
                        Container(height: 28, width: 1, color: Colors.black26),
                        _buildStatItem('0', 'Sakit'),
                        Container(height: 28, width: 1, color: Colors.black26),
                        _buildStatItem('0', 'Izin'),
                        Container(height: 28, width: 1, color: Colors.black26),
                        _buildStatItem('0', 'Alpha'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Judul Profil
                  const Text(
                    'Profil',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Menu Profil (Data Diri, Registrasi Wajah, Reset Wajah)
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.black54, width: 1),
                    ),
                    child: Column(
                      children: [
                        _buildMenuItem(Icons.person_outline, 'Data Diri'),
                        const Divider(height: 1, color: Colors.black26),
                        _buildMenuItem(
                            Icons.crop_square_rounded, 'Registrasi Wajah'),
                        const Divider(height: 1, color: Colors.black26),
                        _buildMenuItem(Icons.refresh_rounded, 'Reset Wajah'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Tombol Logout
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.black54, width: 1),
                    ),
                    child:
                        _buildMenuItem(Icons.logout, 'Logout', isLogout: true),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk Statistik Kehadiran
  Widget _buildStatItem(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  // Widget untuk Menu Item
  Widget _buildMenuItem(IconData icon, String title, {bool isLogout = false}) {
    return ListTile(
      leading: Icon(
        icon,
        color: isLogout ? Colors.purple.shade700 : Colors.black87,
        size: 20,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: isLogout ? Colors.purple.shade700 : Colors.black87,
        ),
      ),
      trailing: isLogout
          ? null
          : const Icon(Icons.arrow_forward_ios,
              size: 14, color: Colors.black54),
      onTap: () {
        // Aksi menu
      },
    );
  }
}
