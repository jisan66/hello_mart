import 'package:flutter/material.dart';

class CustomProductListCard extends StatelessWidget {
  const CustomProductListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: () {},
      child: Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.20),
              spreadRadius: 0,
              blurRadius: 3,
              offset: const Offset(0, 5),
            )
          ],
          color: Colors.blue,
          borderRadius: BorderRadius.circular(25),
        ),
        child:
            Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        child: Image.asset(
                          "assets/images/model2.png",
                          width: double.infinity,
                          // height: 105,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Positioned(
                          right: 8,
                          top: 8,
                          child: Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    // height: 70,
                    // width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16)),
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Watch", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16,color: Colors.white),),
                              Text("\$330", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12,color: Colors.white),)
                            ],
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(100))
                            ),
                            child: InkWell(
                              onTap: (){},
                              child: const Center(child: Icon(Icons.add,color: Colors.blue,size: 25,)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),

      ),
    );
  }
}
