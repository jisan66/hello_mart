import 'package:flutter/material.dart';
import 'package:hello_mart/common_widgets/custom_app_bar.dart';
import 'package:hello_mart/common_widgets/custom_drawer.dart';
import 'package:hello_mart/home_page/custom_promo_card.dart';
import 'package:hello_mart/home_page/custom_video_shorts_card.dart';
import 'package:hello_mart/products_list_screen/product_list_screen.dart';
import '../profile_page/profile_screen.dart';
import 'custom_product_card.dart';


// The main content of the Home tab
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Home Screen'),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextFormField(
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey[600],
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                ),
                style: const TextStyle(color: Colors.black),
              ),

              const SizedBox(height: 12),

              // Category Buttons
              SizedBox(
                height: 40,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return MaterialButton(
                      minWidth: 10,
                      onPressed: () {
                        debugPrint("Pressed button no :: $index");
                      },
                      color: Colors.grey[200],
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 0),
                      child: const Text(
                        "Woman",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 8);
                  },
                  itemCount: 10,
                ),
              ),

              const SizedBox(height: 16),

              // Hot on Hello Mart Section
              buildSectionTitle(context, "Hot on Hello Mart", () {}),
              buildHorizontalListView(const CustomPromoCard(), 3),

              const SizedBox(height: 12),

              // New Arrival Section
              buildSectionTitle(context, "New Arrival", () {}),
              buildHorizontalListView(const CustomVideoShortsCard(), 3),

              const SizedBox(height: 12),

              // Featured Section
              buildSectionTitle(context, "Featured", () {}),
              buildHorizontalListView(const CustomProductCard(), 3),

              const SizedBox(height: 12),

              // Most Popular Section
              buildSectionTitle(context, "Most Popular", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProductListScreen()),
                );
              }),
              buildHorizontalListView(const CustomProductCard(), 3),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build section title
  Widget buildSectionTitle(BuildContext context, String title, VoidCallback onSeeAll) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        TextButton(
          onPressed: onSeeAll,
          child: Text(
            "See All",
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ),
      ],
    );
  }

  // Helper method to build a horizontal ListView
  Widget buildHorizontalListView(Widget item, int itemCount) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) => item,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemCount: itemCount,
      ),
    );
  }
}
