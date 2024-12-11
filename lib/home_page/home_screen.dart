import 'package:flutter/material.dart';
import 'package:hello_mart/common_widgets/custom_app_bar.dart';
import 'package:hello_mart/common_widgets/custom_drawer.dart';
import 'package:hello_mart/home_page/custom_promo_card.dart';
import 'package:hello_mart/home_page/custom_video_shorts_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Home Screen',
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ////////////////////////////////Search Bar////////////////////////////////////////////
            TextFormField(
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                // Light grey background
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.grey[600]),
                // Hint text color
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey[600], // Magnifier icon color
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none, // Removes the border
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
              style: const TextStyle(color: Colors.black),
            ),
        
            ///////////////////////Category button/////////////////////////////////////////////
            const SizedBox(
              height: 12,
            ),
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
                      // Background color
                      elevation: 0,
                      // Button elevation for shadow
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(16), // Rounded corners
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 0),
                      // Internal padding
                      child: const Text(
                        "Woman",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400, // Text color
                          fontSize: 14, // Font size
                          // Font weight
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 8,
                    );
                  },
                  itemCount: 10),
            ),
        
            //////////////////////////////////////Shop Now Container///////////////////////////////////////////
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Hot on Hello Mart", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
                TextButton(onPressed: () {  },
                child: Text("See All",style: TextStyle(color: Colors.grey.shade600),))
              ],
            ),
            SizedBox(
              height: 180,
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const CustomPromoCard();
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 12,
                    );
                  },
                  itemCount: 3),
            ),
            ///////////////////////Video Category/////////////////////////////
            const SizedBox(
              height: 18,
            ),
            SizedBox(
              height: 250,
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const CustomVideoShortsCard();
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 12,
                    );
                  },
                  itemCount: 3),
        
            )
          ],
        ),
      ),


      /////////////////////Bottom Nav Bar///////////////////////////////
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        // Ensures all items are visible
        selectedItemColor: Colors.blue,
        // Selected item color
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Sell',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.all_inbox_outlined),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
