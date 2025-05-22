import 'package:flutter/material.dart';
import 'package:shop_app/constants/product_constant.dart';
import 'package:shop_app/screens/home/filter_list.dart';
import 'package:shop_app/screens/product_detail/product_detail_screen.dart';
import 'package:shop_app/ui/product_card.dart';

class ProductListHomePage extends StatefulWidget {
  const ProductListHomePage({super.key});

  @override
  State<ProductListHomePage> createState() => _ProductListHomePageState();
}

class _ProductListHomePageState extends State<ProductListHomePage> {
  final List<String> filterList = const [
    'All',
    'Adidas',
    'Nike',
    'Puma',
    'Balenciaga',
  ];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filterList[0];
  }

  void onSelectFilter(String targetFilter) {
    setState(() {
      selectedFilter = targetFilter;
    });
  }

  @override
  Widget build(BuildContext context) {
    final productList = ProductConstant.productList;
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 36,
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search',
            ),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          FilterList(
            filterList: filterList,
            selectedFilter: selectedFilter,
            onSelectFilter: onSelectFilter,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
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
                          builder:
                              (context) =>
                                  ProductDetailScreen(product: product),
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
          ),
        ],
      ),
    );
  }
}
