import 'package:flutter/material.dart';
import 'package:shop_app/constants/product_constant.dart';
import 'package:shop_app/screens/product_detail/product_detail_screen.dart';
import 'package:shop_app/ui/product_card.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final productList = ProductConstant.productList;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        width: double.infinity,
        height: 650,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: productList.length,
          itemBuilder: (context, index) {
            final product = productList[index];
            final productTitle = product['title'] as String;
            final productPrice = product['price'].toString();
            final productImageUrl = product['imageUrl'] as String;
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(product: product),
                  ),
                );
              },
              child: ProductCard(
                title: productTitle,
                price: productPrice,
                imageUrl: productImageUrl,
              ),
            );
          },
        ),
      ),
    );
  }
}
