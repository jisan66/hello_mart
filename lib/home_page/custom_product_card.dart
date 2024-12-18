import 'package:flutter/material.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {},
      child: Container(
        width: 150,
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Expanded(
              flex: 2,
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
                      // height: 100,
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
              flex: 1,
              child: Container(
                // height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16)),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Watch", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16,color: Colors.white),),
                      Text("\$330", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12,color: Colors.white),)
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
