import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late int selectedSize = 0;

  @override
  void initState() {
    super.initState();
  }

  void onSelectSize(int size) {
    setState(() {
      selectedSize = size;
    });
  }

  void onAddToCart() {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.addItemToCart(widget.product);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Item added to cart')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail')),
      body: Column(
        children: [
          Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(flex: 1),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Image.asset(widget.product['imageUrl']),
          ),
          const Spacer(flex: 2),
          Container(
            width: double.infinity,
            height: 250,
            padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, -4),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  '\$${widget.product['price'].toString()}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: GestureDetector(
                          onTap: () => onSelectSize(index),
                          child: Chip(
                            backgroundColor:
                                selectedSize == index
                                    ? Theme.of(context).colorScheme.onSecondary
                                    : Theme.of(context).colorScheme.onPrimary,
                            label: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Text(
                                widget.product['sizes'][index].toString(),
                              ),
                            ),
                            labelStyle: TextStyle(
                              color:
                                  selectedSize == index
                                      ? Theme.of(context).colorScheme.onPrimary
                                      : Theme.of(
                                        context,
                                      ).colorScheme.onSecondary,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: onAddToCart,
                  child: SizedBox(
                    width: double.infinity,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 10,
                        children: [
                          Icon(Icons.shopping_cart, size: 24),
                          Text(
                            'Add to cart',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
