import 'package:flutter/material.dart';
import 'package:hello_mart/common_widgets/custom_app_bar.dart';
import 'package:hello_mart/products_list_screen/product_list_card.dart';
import '../common_widgets/custom_drawer.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Products",
      ),
      drawer: const CustomDrawer(),
      body: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(12),
        itemCount: 30,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 24, crossAxisSpacing: 24),
          itemBuilder: (context, index){
        return const CustomProductListCard();
      })
    );
  }
}
