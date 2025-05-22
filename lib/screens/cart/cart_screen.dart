import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  void _removeCartItem(
    BuildContext context,
    CartProvider cartProvider,
    String productId,
  ) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Remove item from cart',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          content: Text(
            'Are you sure you want to remove this item from cart?',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No', style: Theme.of(context).textTheme.bodyMedium),
            ),
            TextButton(
              onPressed: () {
                cartProvider.removeItemFromCart(productId);
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Item removed from cart')),
                );
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child:
            cartProvider.cartItems.isEmpty
                ? Center(
                  child: Text(
                    'No items in cart',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                )
                : ListView.builder(
                  itemCount: cartProvider.cartItems.length,
                  itemBuilder: (context, index) {
                    final product = cartProvider.cartItems[index];

                    return ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                          product['imageUrl'] as String,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed:
                            () => _removeCartItem(
                              context,
                              cartProvider,
                              product['id'] as String,
                            ),
                        icon: Icon(Icons.delete, color: Colors.red),
                      ),
                      title: Text(
                        product['title'] as String,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(
                        '\$${product['price'].toString()}',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    );
                  },
                ),
      ),
    );
  }
}
