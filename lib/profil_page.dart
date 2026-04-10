import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.orange[800], size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50], // Tetap mempertahankan tema kuning
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Bagian Header profil dengan warna mengikuti warna AppBar
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 20, bottom: 40),
              decoration: const BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage("assets/nailong.jpeg"),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Ai Nur Azizah",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Rank Gold",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
            
            // Bagian Detail Informasi yang dibuat menumpuk profil (Overlap)
            Transform.translate(
              offset: const Offset(0, -20),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  elevation: 8,
                  shadowColor: Colors.orange.withOpacity(0.3),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      children: [
                        _buildInfoRow(Icons.person_outline, "Nama Depan", "Ai"),
                        Divider(indent: 70, endIndent: 20, color: Colors.grey[200]),
                        _buildInfoRow(Icons.person_outline, "Nama Belakang", "Nur Azizah"),
                        Divider(indent: 70, endIndent: 20, color: Colors.grey[200]),
                        _buildInfoRow(Icons.female_outlined, "Jenis Kelamin", "Perempuan"),
                        Divider(indent: 70, endIndent: 20, color: Colors.grey[200]),
                        _buildInfoRow(Icons.location_on_outlined, "Alamat", "Jl. Merdeka No. 45, Bandung"),
                        Divider(indent: 70, endIndent: 20, color: Colors.grey[200]),
                        _buildInfoRow(Icons.phone_outlined, "Nomor HP", "0812-3456-7890"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}