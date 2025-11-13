import 'package:flutter/material.dart';
import '../models/food_item.dart';

class DetailPage extends StatelessWidget {
  final FoodItem? item;

  const DetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    if (item == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Detail')),
        body: const Center(child: Text('Item tidak ditemukan.')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(item!.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AspectRatio(
                aspectRatio: 4 / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    item!.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (c, e, s) => const ColoredBox(
                      color: Colors.grey,
                      child: Icon(Icons.fastfood, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(item!.name, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text('Rp ${item!.price.toStringAsFixed(0)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              const SizedBox(height: 12),
              Text(item!.description),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Memesan ${item!.name}')));
                },
                icon: const Icon(Icons.shopping_cart),
                label: const Text('Pesan Sekarang'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}