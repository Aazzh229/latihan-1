import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class KatalogProduk extends StatelessWidget {
  KatalogProduk({super.key});

  final List<Product> products = [
    Product(
      id: '1',
      name: 'Produk A',
      description: 'Deskripsi singkat untuk Produk A',
      price: 150000,
      imageUrl: 'https://picsum.photos/id/1/200/200',
    ),
    Product(
      id: '2',
      name: 'Produk B',
      description: 'Deskripsi singkat untuk Produk B',
      price: 250000,
      imageUrl: 'https://picsum.photos/id/2/200/200',
    ),
    Product(
      id: '3',
      name: 'Produk C',
      description: 'Deskripsi singkat untuk Produk C',
      price: 350000,
      imageUrl: 'https://picsum.photos/id/3/200/200',
    ),
    Product(
      id: '4',
      name: 'Produk D',
      description: 'Deskripsi singkat untuk Produk D',
      price: 450000,
      imageUrl: 'https://picsum.photos/id/4/200/200',
    ),
    Product(
      id: '5',
      name: 'Produk E',
      description: 'Deskripsi singkat untuk Produk E',
      price: 550000,
      imageUrl: 'https://picsum.photos/id/5/200/200',
    ),
    Product(
      id: '6',
      name: 'Produk F',
      description: 'Deskripsi singkat untuk Produk F',
      price: 650000,
      imageUrl: 'https://picsum.photos/id/6/200/200',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Produk'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                      height: 120,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          product.description,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Rp ${product.price.toStringAsFixed(0)}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
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
    );
  }
}