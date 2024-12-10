import 'package:flutter/material.dart';
import 'package:hello_mart/common_widgets/custom_app_bar.dart';
import 'package:hello_mart/common_widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Home Screen',),
      drawer: const CustomDrawer(),
      body: Column(
        children: [

          ////////////////////////////////Search Bar////////////////////////////////////////////
          TextFormField(
            onTapOutside: (event){FocusScope.of(context).unfocus();},
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200], // Light grey background
              hintText: "Search",
              hintStyle: TextStyle(color: Colors.grey[600]), // Hint text color
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey[600], // Magnifier icon color
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none, // Removes the border
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
            style: const TextStyle(color: Colors.black),
          ),

          ///////////////////////Category button/////////////////////////////////////////////
          SizedBox(height: 12,),
          SizedBox(
            height: 40,
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
              return MaterialButton(
                minWidth: 10,
                onPressed: () {
                  debugPrint("Pressed button no :: $index");
                },
                color: Colors.grey[200], // Background color
                elevation: 0, // Button elevation for shadow
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16), // Rounded corners
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0), // Internal padding
                child:Text(
                  "Woman",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,// Text color
                    fontSize: 14, // Font size
                    // Font weight
                  ),
                ),
              );
            }, separatorBuilder: (context, index){return SizedBox(width: 8,);}, itemCount: 10),
          )
        ],
      ),
    );
  }
}
