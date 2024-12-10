import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.shopping_basket_outlined, size: 100,),
              Text("This is Drawer Header", style: TextStyle(fontSize: 16),)
            ],
          ),),
          ListTile(
            hoverColor: Colors.lightBlueAccent,
            tileColor: Colors.blue,
            title: Text("My Cart", style: TextStyle(color: Colors.white),),
            trailing: Icon(Icons.shopping_cart_checkout,color: Colors.white,),
            onTap: (){
              debugPrint("The cart item pressed");
            },
          )
        ],
      ),
    );
  }
}
