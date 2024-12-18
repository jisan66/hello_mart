import 'package:flutter/material.dart';
import 'package:hello_mart/common_widgets/custom_app_bar.dart';
import 'package:hello_mart/common_widgets/custom_drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    List<IconData> icons = [Icons.person, Icons.settings, Icons.perm_contact_cal, Icons.share, Icons.help];
    List<String> names = ['Profile', 'Setting', 'Contact', 'Share App', 'Help'];

    return Scaffold(
      appBar: CustomAppBar(title: 'Profile',),
      drawer: const CustomDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 24,),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.blue,
                ),
                child: const ClipOval(
                  child: Icon(Icons.person, color: Colors.white,),
                ),
              ),
              const SizedBox(height: 16,),
              const Text("Jisan Saha", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const Text("jisan.saha.js@gmail.com", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300,color: Colors.grey)),
              SizedBox(height: 24,),
              ListView.separated(
                shrinkWrap: true,
                  itemCount:5, itemBuilder: (context, index){
                return
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: InkWell(
                    onTap: (){
                      debugPrint("Seleced Index --- ${names[index]}");
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                      width: double.infinity,
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.shade200
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(flex: 1,child: Icon(icons[index], size: 32,color: Colors.black87.withOpacity(.7),)),
                          SizedBox(width: 12,),
                          Expanded(flex: 8,child: Text(names[index],style: TextStyle(fontSize: 18,color: Colors.black87.withOpacity(.7)),)),
                          Expanded(flex:1,child: Icon(Icons.arrow_forward_ios, color: Colors.black87.withOpacity(.5),))
                        ],
                      ),
                    ),
                  ),
                )
                  ;
              }, separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 8,);
              },)
            ],
          ),
        ),
      )
    );
  }
}
