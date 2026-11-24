import 'package:flutter/material.dart';

class LmsScreen extends StatelessWidget {
  const LmsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F8),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ================= HEADER UNGU (BERHENTI DI NAMA SEKOLAH) =================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: 48,
                left: 20,
                right: 20,
                bottom: 22,
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
              child: Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.5),
                      image: const DecorationImage(
                        image: AssetImage('assets/pp.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pembelajaran',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'SMA Saint Peter\'s School · Cambridge International',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // ================= KONTEN UTAMA =================
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Kotak Pencarian (Search Bar)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.black54, width: 1),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        icon:
                            Icon(Icons.search, color: Colors.black54, size: 20),
                        hintText: 'Cari mata pelajaran...',
                        hintStyle:
                            TextStyle(color: Colors.black45, fontSize: 13),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Kotak Statistik
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.black54, width: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatItem('4', 'Mata Pelajaran'),
                        Container(height: 28, width: 1, color: Colors.black26),
                        _buildStatItem('0', 'Materi'),
                        Container(height: 28, width: 1, color: Colors.black26),
                        _buildStatItem('0', 'Tugas Aktif'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Judul Mata Pelajaran
                  const Text(
                    'Mata Pelajaran',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Kartu Mata Pelajaran (Background Putih, Kotak Inisial Ungu #E7DDF5 dengan Border #9575CD)
                  _buildSubjectCard(
                    code: 'MP',
                    title: 'MIPA',
                    teacher: 'Yohanes Mario D.B, S.Pd.',
                    materialCount: '0 Materi',
                    taskCount: '0 Tugas',
                  ),
                  const SizedBox(height: 12),

                  _buildSubjectCard(
                    code: 'PS',
                    title: 'IPS',
                    teacher: 'Rosita Sitorus, S.E.',
                    materialCount: '0 Materi',
                    taskCount: '0 Tugas',
                  ),
                  const SizedBox(height: 12),

                  _buildSubjectCard(
                    code: 'BM',
                    title: 'Bahasa Mandarin',
                    teacher: 'Balsamus Pieter D, S.Fil.',
                    materialCount: '0 Materi',
                    taskCount: '0 Tugas',
                  ),
                  const SizedBox(height: 12),

                  _buildSubjectCard(
                    code: 'BJ',
                    title: 'Bahasa Jerman',
                    teacher: 'Rina Rustiyawati, S.T.',
                    materialCount: '0 Materi',
                    taskCount: '0 Tugas',
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

  Widget _buildSubjectCard({
    required String code,
    required String title,
    required String teacher,
    required String materialCount,
    required String taskCount,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white, // Kartu utama warna putih bersih
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
            color: Colors.black54, width: 1), // Bingkai garis hitam tipis
      ),
      child: Row(
        children: [
          // Kotak Inisial Mapel (Background #E7DDF5, Border #9575CD)
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFE7DDF5),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFF9575CD), width: 1.2),
            ),
            alignment: Alignment.center,
            child: Text(
              code,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF493568),
              ),
            ),
          ),
          const SizedBox(width: 14),
          // Info Mata Pelajaran & Guru
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  teacher,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.book_outlined,
                            size: 12, color: Colors.black54),
                        const SizedBox(width: 4),
                        Text(materialCount,
                            style: const TextStyle(
                                color: Colors.black54, fontSize: 10)),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Row(
                      children: [
                        const Icon(Icons.assignment_outlined,
                            size: 12, color: Colors.black54),
                        const SizedBox(width: 4),
                        Text(taskCount,
                            style: const TextStyle(
                                color: Colors.black54, fontSize: 10)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
