import 'package:flutter/material.dart';
class CustomAppBar extends StatelessWidget  implements PreferredSizeWidget{
  final String title;
  final Widget? leading;
  final List<Widget>? actions;
  final double height;

  CustomAppBar({
    required this.title,
    this.leading,
    this.actions,
    this.height = kToolbarHeight,
  });


  @override
  Widget build(context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      title: Text(title.toString()),
      centerTitle: true,
      leading: Builder(
        builder: (BuildContext innerContext) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              debugPrint("Drawer button pressed");
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
      // actions: [
      //   IconButton(
      //     icon: Icon(Icons.search, color: Colors.black),
      //     onPressed: () {
      //       print("Search pressed");
      //     },
      //   ),
      //   IconButton(
      //     icon: Icon(Icons.notifications, color: Colors.black),
      //     onPressed: () {
      //       print("Notifications pressed");
      //     },
      //   ),
      // ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
