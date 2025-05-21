import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;
  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Card(
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Text('\$$price', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 8),
              Image.asset(imageUrl, height: 200),
            ],
          ),
        ),
      ),
    );
  }
}
