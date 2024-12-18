import 'package:flutter/material.dart';

class CustomPromoCard extends StatelessWidget {
  const CustomPromoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 350,
      decoration: const BoxDecoration(
        color: Color(0xFFF8CCD9),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
              flex : 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Flexible(flex: 3,child: Text("Now Available! HELLO MART X Hello Kitty", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)),
                    SizedBox(height: 8,),
                    Flexible(
                        flex: 2,
                        child: Text(
                            "20% off exclusively on Thrif. Use Code HELLOMART" ,style: TextStyle(fontSize: 12,color: Colors.grey.shade600))),
                    const SizedBox(
                      height: 12,
                    ),
                    Flexible(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: MaterialButton(
                            height: 40,
                              minWidth: 10,
                              onPressed: () {},
                              color: Colors.black,
                              // Background color
                              elevation: 0,
                              // Button elevation for shadow
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(10), // Rounded corners
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 4),
                              // Internal padding
                              child: const Text(
                                "Shop Now",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400, // Text color
                                  fontSize: 14, // Font size
                                  // Font weight
                                ),
                              )),
                        ))
                  ],
                ),
              )),
          Flexible(
            flex: 2,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              child: Image.asset(
                "assets/images/model1.jpg",
                height: 350,
                fit: BoxFit.cover,
              ),
            ),
          ),              ],
      ),
    );
  }
}
