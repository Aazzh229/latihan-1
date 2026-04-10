import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  Widget buildInfo(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Card(
                color: Colors.yellow[100],
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage:
                            AssetImage("assets/nailong.jpeg"),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Ai Nur Azizah",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            Center(
              child: Card(
                color: Colors.yellow[100],
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildInfo("Nama : Ai Nur Azizah"),
                      buildInfo("NIM : 2306077"),
                      buildInfo("Kelas : Informatika C"),
                      buildInfo("Hobi : tidak melakukan apa apa"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}