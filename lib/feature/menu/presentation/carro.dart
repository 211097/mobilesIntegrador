import 'package:flutter/material.dart';

class Carro extends StatefulWidget {
  const Carro({super.key});

  @override
  State<Carro> createState() => _WeAreState();
}

class _WeAreState extends State<Carro> {
  int quantity = 0;
  int price = 66;

  void updateQuantity(int change) {
    setState(() {
      quantity += change;
      if (quantity < 0) quantity = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    int total = price * quantity;

    return Scaffold(
      backgroundColor: const Color(0xFFBDCEA1),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        title: const Text(
          "SEZZON",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                CartItem(
                  name: "Brochetas de pollo",
                  price: price,
                  quantity: quantity,
                  onIncrease: () => updateQuantity(1),
                  onDecrease: () => updateQuantity(-1),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total: \$ $total",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.deepOrange,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {},
                  child: const Text("Finalizar pedido"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String name;
  final int price;
  final int quantity;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const CartItem({
    super.key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/a.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text("\$$price"),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: quantity > 0 ? onDecrease : null,
              ),
              Text("$quantity"),
              IconButton(icon: const Icon(Icons.add), onPressed: onIncrease),
            ],
          ),
          IconButton(icon: const Icon(Icons.delete), onPressed: () {}),
        ],
      ),
    );
  }
}
