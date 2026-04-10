import 'package:flutter/material.dart';
import 'katalog_produk.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class KeranjangPage extends StatefulWidget {
  final List<CartItem> cartItems;

  const KeranjangPage({super.key, required this.cartItems});

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {

  int getTotal() {
    int total = 0;
    for (var item in widget.cartItems) {
      int price = int.parse(item.product.price.replaceAll('.', ''));
      total += price * item.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.cartItems.isEmpty) {
      return const Center(
        child: Text("Keranjang kosong 🛒"),
      );
    }

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget.cartItems.length,
            itemBuilder: (context, index) {
              final item = widget.cartItems[index];

              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: ListTile(
                  leading: Image.network(item.product.imageUrl, width: 50),
                  title: Text(item.product.name),
                  subtitle: Text('Rp ${item.product.price}'),

                  // 🔥 KONTROL JUMLAH
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (item.quantity > 1) {
                              item.quantity--;
                            }
                          });
                        },
                      ),

                      Text(item.quantity.toString()),

                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            item.quantity++;
                          });
                        },
                      ),

                      // 🔥 HAPUS ITEM
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            widget.cartItems.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        // 🔥 TOTAL
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "Rp ${getTotal()}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}