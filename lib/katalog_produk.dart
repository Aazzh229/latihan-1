import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final String price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class KatalogProduk extends StatefulWidget {
  final Function(Product) onAddToCart;

  const KatalogProduk({
    super.key,
    required this.onAddToCart,
  });

  @override
  State<KatalogProduk> createState() => _KatalogProdukState();
}

class _KatalogProdukState extends State<KatalogProduk> {
  List<Product> products = [
    Product(
      id: '1',
      name: 'Samsung Galaxy Book',
      description: 'Laptop ringan & cepat',
      price: '15.000.000',
      imageUrl: 'https://picsum.photos/id/1/200/200',
    ),
    Product(
      id: '2',
      name: 'ASUS VivoBook',
      description: 'Cocok untuk mahasiswa',
      price: '25.000.000',
      imageUrl: 'https://picsum.photos/id/2/200/200',
    ),
    Product(
      id: '3',
      name: 'MacBook Air',
      description: 'Tipis dan powerful',
      price: '35.000.000',
      imageUrl: 'https://picsum.photos/id/3/200/200',
    ),
    Product(
      id: '4',
      name: 'Dell XPS',
      description: 'Premium performance',
      price: '45.000.000',
      imageUrl: 'https://picsum.photos/id/4/200/200',
    ),
  ];

  void _showAddProductDialog() {
    final nameController = TextEditingController();
    final descController = TextEditingController();
    final priceController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Tambah Produk"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: "Nama Produk"),
                ),
                TextField(
                  controller: descController,
                  decoration: const InputDecoration(labelText: "Deskripsi"),
                ),
                TextField(
                  controller: priceController,
                  decoration: const InputDecoration(labelText: "Harga"),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Batal"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              onPressed: () {
                setState(() {
                  products.add(
                    Product(
                      id: DateTime.now().toString(),
                      name: nameController.text,
                      description: descController.text,
                      price: priceController.text,
                      imageUrl: 'https://picsum.photos/200',
                    ),
                  );
                });

                Navigator.pop(context);
              },
              child: const Text("Tambah"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.9,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final product = products[index];

            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: Image.network(
                      product.imageUrl,
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),

                        const SizedBox(height: 4),

                        Text(
                          product.description,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),

                        const SizedBox(height: 6),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Rp ${product.price}',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),

                            // 🔥 SEKARANG TERHUBUNG KE MAIN
                            IconButton(
                              icon: const Icon(Icons.add_shopping_cart, color: Colors.orange),
                              onPressed: () {
                                widget.onAddToCart(product);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("${product.name} ditambahkan"),
                                    duration: const Duration(seconds: 1),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: _showAddProductDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}