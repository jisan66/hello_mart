import 'package:flutter/material.dart';
import 'package:hello_mart/start_selling/slider_button.dart';
import 'package:hello_mart/start_selling/wave_painter.dart';

class StartSellingScreen extends StatefulWidget {
  const StartSellingScreen({super.key});

  @override
  State<StartSellingScreen> createState() => _StartSellingScreenState();
}

class _StartSellingScreenState extends State<StartSellingScreen> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body : Column(
        children: [
          Expanded(
            flex: 5,
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(
                      size.width,
                      size.height / 1.75,
                    ),
                    painter: WavePainter(),
                  ),
                  Positioned(
                    top: size.height*0.4,
                    left: 0,
                    child: SizedBox(
                      height: size.height /4,
                      width: size.width,
                      child: Image.asset("assets/images/shop1.png",fit: BoxFit.fitHeight,),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(flex: 2, child: Column(children: [
            Expanded(flex: 2, child: Center(child: Text("Reach and Connect with buyers who value\nsustainability and unique finds.",textAlign: TextAlign.center,))),
            Expanded(flex: 1, child: SizedBox(width: size.width, child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
              child: Center(
                child: SliderButton(
                  text: 'Slide to Start',
                  onSlided: () {
                    // Handle the action when the button is slided
                    print('Slider Button Slided!');
                  },
                ),
              ),
            ),)),
          ],))
        ],
      )
    );
  }
}
