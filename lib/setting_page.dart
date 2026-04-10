import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ListTile(
          leading: const Icon(Icons.notifications, color: Colors.orange),
          title: const Text("Notifikasi"),
          subtitle: const Text("Atur notifikasi"),
          onTap: () {},
        ),
        const Divider(),

        ListTile(
          leading: const Icon(Icons.color_lens, color: Colors.orange),
          title: const Text("Tema"),
          subtitle: const Text("Mode terang / gelap"),
          onTap: () {},
        ),
      ],
    );
  }
}