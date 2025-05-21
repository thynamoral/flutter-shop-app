import 'package:flutter/material.dart';
import 'package:shop_app/constants/product_constant.dart';
import 'package:shop_app/screens/home/filter_list.dart';
import 'package:shop_app/screens/home/product_list.dart';
import 'package:shop_app/ui/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> filterList = const [
    'All',
    'Adidas',
    'Nike',
    'Puma',
    'Balenciaga',
  ];
  late String selectedFilter;
  final productList = ProductConstant.productList;

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
          ProductList(),
        ],
      ),
    );
  }
}
