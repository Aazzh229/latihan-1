import 'package:flutter/material.dart';
import 'profil_page.dart';
import 'katalog_produk.dart';
import 'keranjang_page.dart';
import 'setting_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latihan',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Selamat Datang 👋",
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              "Temukan produk terbaik untuk kebutuhanmu",
              style: TextStyle(color: Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // 🛒 STATE KERANJANG (INI YANG PENTING SEKARANG)
  List<CartItem> cartItems = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _buildPages() {
    return [
      const HomePage(),

      // 🔥 KATALOG
      KatalogProduk(
        onAddToCart: (product) {
          setState(() {
            final index = cartItems.indexWhere(
              (item) => item.product.id == product.id,
            );

            if (index >= 0) {
              cartItems[index].quantity++;
            } else {
              cartItems.add(CartItem(product: product));
            }
          });
        },
      ),

      // 🔥 KERANJANG
      KeranjangPage(cartItems: cartItems),

      const SettingPage(),
      ProfilePage(),
    ];
  }

  final List<String> _titles = [
    "Beranda",
    "Katalog",
    "Keranjang",
    "Pengaturan",
    "Profil"
  ];

  @override
  Widget build(BuildContext context) {
    final pages = _buildPages();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_selectedIndex],
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "Katalog"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Keranjang"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }
}