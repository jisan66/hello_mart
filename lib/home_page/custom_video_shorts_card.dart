import 'package:flutter/material.dart';

class CustomVideoShortsCard extends StatelessWidget {
  const CustomVideoShortsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        height: 250,
        width: 120,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16))
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16),
              ),
              child: Image.asset(
                "assets/images/model1.jpg",
                height: 350,
                fit: BoxFit.cover,
              ),
            ),
            Container(decoration: BoxDecoration(
                color: Colors.black.withOpacity(.2),
                borderRadius: const BorderRadius.all(Radius.circular(16))
            ),),
            const Positioned(right: 8, top: 8, child: Icon(Icons.play_arrow_outlined, color: Colors.white,))
          ],
        ),
      ),
    );
  }
}
