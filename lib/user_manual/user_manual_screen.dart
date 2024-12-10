import 'package:flutter/material.dart';
import 'package:hello_mart/start_selling/slider_button.dart';
import 'package:hello_mart/user_manual/cutom_wave_painter.dart';

import '../start_selling/wave_painter.dart';

void main() {
  runApp(MaterialApp(home: PageViewExample()));
}

class PageViewExample extends StatefulWidget {
  @override
  _PageViewExampleState createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> pages = [
    {
      "title": "Step 1",
      "description": "This is the first page.",
      "wave_height": 0.5,
      "image" : "assets/images/shop1.png"
    },
    {
      "title": "Step 2",
      "description": "This is the second page.",
      "wave_height": 1.0,
      "image" : "assets/images/shop1.png"
    },
    {
      "title": "Step 3",
      "description": "This is the final page.",
      "wave_height": 0.5,
      "image" : "assets/images/shop1.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: pages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return _buildPageContent(
                    title: pages[index]["title"]!,
                    description: pages[index]["description"]!,
                    waveHeight: pages[index]["wave_height"]!,
                image: pages[index]["image"]!);
              },
            ),
          ),
          _buildNavigationButtons(),
        ],
      ),
    );
  }

  Widget _buildPageContent(
      {required String title,
      required String description,
      required double waveHeight,
      required String image}) {
    Size size = MediaQuery.of(context).size;
    return Column(
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
                  painter: CustomWavePainter(waveHeight: waveHeight),
                ),
                Positioned(
                  top: 200, // 200px down from the top
                  left: 0, // Add some padding from left
                  right: 0, // Add some padding from right
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20), // Customize style
                    maxLines: 2, // Allow only two lines
                    overflow: TextOverflow
                        .ellipsis, // Handle overflow with an ellipsis
                  ),
                ),
                Positioned(
                  top: size.height * 0.4,
                  left: 0,
                  child: SizedBox(
                    height: size.height / 4,
                    width: size.width,
                    child: Image.asset(
                      image,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                    flex: 3,
                    child: Center(
                        child: Text(
                      description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
                    ))),
                Expanded(
                    flex: 2,
                    child: SizedBox(
                      width: size.width,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                      ),
                    )),
              ],
            ))
      ],
    );
  }

  Widget _buildNavigationButtons() {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: _currentPage < pages.length - 1
            ? Container(
                decoration: const BoxDecoration(
                    color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(16))),
                width: double.infinity,
                child: MaterialButton(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Text("Next", style: TextStyle(color: Colors.white),)))
            : SliderButton(onSlided: () {}, text: "Slide to Start Now",)
        //   Container(
        //     width: double.infinity,
        //     child: ElevatedButton(
        //       onPressed: () {
        //         _pageController.previousPage(
        //           duration: Duration(milliseconds: 300),
        //           curve: Curves.easeInOut,
        //         );
        //       },
        //       child: Text("Back"),
        //     ),
        //   )
        // else
        //   SizedBox.shrink(),
        // ElevatedButton(
        //   onPressed: () {
        //     if (_currentPage < pages.length - 1) {
        //       _pageController.nextPage(
        //         duration: Duration(milliseconds: 300),
        //         curve: Curves.easeInOut,
        //       );
        //     } else {
        //       // Perform a finish action
        //       ScaffoldMessenger.of(context).showSnackBar(
        //         SnackBar(content: Text("You have completed all steps!")),
        //       );
        //     }
        //   },
        //   child: Text(_currentPage < pages.length - 1 ? "Next" : "Finish"),
        // ),
        );
  }
}
