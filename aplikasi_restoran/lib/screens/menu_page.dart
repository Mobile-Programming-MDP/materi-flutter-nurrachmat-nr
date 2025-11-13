import 'package:flutter/material.dart';
import '../models/food_item.dart';

class MenuPage extends StatelessWidget {
  final List<FoodItem> menu;
  final void Function(FoodItem) onItemTap;

  const MenuPage({super.key, required this.menu, required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: menu.length,
      itemBuilder: (context, index) {
        final item = menu[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: ListTile(
            leading: SizedBox(
              width: 64,
              height: 64,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  item.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (c, e, s) => const ColoredBox(
                    color: Colors.grey,
                    child: Icon(Icons.fastfood, color: Colors.white),
                  ),
                ),
              ),
            ),
            title: Text(item.name),
            subtitle: Text('Rp ${item.price.toStringAsFixed(0)}'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => onItemTap(item),
          ),
        );
      },
    );
  }
}
