import 'package:flutter/material.dart';
import 'package:shop_app/constants/product_constant.dart';
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
            return ProductCard(
              title: product['title'] as String,
              price: product['price'].toString(),
              imageUrl: product['imageUrl'] as String,
            );
          },
        ),
      ),
    );
  }
}
