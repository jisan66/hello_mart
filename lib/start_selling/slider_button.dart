import 'dart:math';

import 'package:flutter/material.dart';

class SliderButton extends StatefulWidget {
  final double height;
  final animationDuration = const Duration(milliseconds: 300);
  final String? text;
  final Function() onSlided;
  final bool enabled;
  final SliderButtonController? controller;
  const SliderButton({required this.onSlided, this.text, this.controller,this.height = 60, this.enabled = true, super.key});

  @override
  State<SliderButton> createState() => _SliderButtonState();
}

class SliderButtonController extends ChangeNotifier {
  void reset() {
    notifyListeners();
  }
}

/////////////////////////////Slider Button State////////////////////////////////////////

class _SliderButtonState extends State<SliderButton> with SingleTickerProviderStateMixin {
  double _sliderRelativePosition = 0.025; // values 0 -> 1
  double _startedDraggingAtX = 0.0;
  late final AnimationController _animationController;
  late final Animation _sliderAnimation;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      widget.controller!.addListener(reset);
    }
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
    _sliderAnimation = CurveTween(curve: Curves.bounceInOut).animate(_animationController);

    _animationController.addListener(() {
      setState(() {
        _sliderRelativePosition = _sliderAnimation.value == 0 ? 0.025 : _sliderAnimation.value ;
        debugPrint("_sliderRelativePosition$_sliderRelativePosition");
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  ////////////////////////////////Implementing Build Method//////////////////////////////////////

  @override
  void reset() {
    _animationController.reverse(from: _sliderRelativePosition );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(_radius),
        border: _border,
      ),
      child: LayoutBuilder(
        builder: (_, BoxConstraints constraints) {
          debugPrint("constraints.maxWidth.toString()${constraints.maxWidth.toString()}");
          debugPrint("widget.height${widget.height}");
          final sliderRadius = widget.height / 2;
          debugPrint("sliderRadius$sliderRadius");
          final sliderMaxX = constraints.maxWidth - 2 * sliderRadius;
          debugPrint("sliderMaxX$sliderMaxX");
          final sliderPosX = sliderMaxX * _sliderRelativePosition;
          debugPrint("sliderPosX$sliderPosX");
          debugPrint("_sliderRelativePosition$_sliderRelativePosition");
          return Stack(
            children: [
              _buildBackground(width: constraints.maxWidth, backgroundSplitX: sliderPosX + sliderRadius),
              _buildText(),
              _buildSlider(sliderMaxX: sliderMaxX, sliderPositionX: sliderPosX),
            ],
          );
        },
      ),
    );
  }

  /////////////////////////////////Building Background and Text/////////////////////////////////////////////

  // double _sliderRelativePosition = 0.5; // Start at center

  Widget _buildBackground({required double width, required double backgroundSplitX}) {
    // backgroundSplitX = backgroundSplitX + 10;
    debugPrint("width$width");
    debugPrint("backgroundSplitX$backgroundSplitX");
    debugPrint("_startedDraggingAtX$_startedDraggingAtX");
    debugPrint("_sliderAnimation.value${_sliderAnimation.value}");

    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Container(
            height: widget.height,
            width: _sliderRelativePosition > 0.025  ?  _sliderRelativePosition == 1 ? width :  backgroundSplitX : 0  , // Adjust to show blue
            // width: width , // Adjust to show red
            decoration: BoxDecoration(
              borderRadius: _sliderRelativePosition > 0.025  &&  _sliderRelativePosition < 1  ? BorderRadius.only(topLeft: _radius, bottomLeft: _radius,) : BorderRadius.all(_radius),
              color: Colors.blue,
              border: _border
            ),
          ),
          // Container(
          //   height: widget.height,
          //   width: width - backgroundSplitX,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.only(topRight: _radius, bottomRight: _radius),
          //     color: widget.enabled ? Colors.blue : Theme.of(context).disabledColor,
          //   ),
          // ),
          Container(
            height:widget.height,
            width: _sliderRelativePosition > 0.025 ? _sliderRelativePosition == 1 ? 0 : width - backgroundSplitX : width,
            decoration: BoxDecoration(
              borderRadius: _sliderRelativePosition > 0.025  ? BorderRadius.only(topRight: _radius, bottomRight: _radius,) : BorderRadius.all(_radius),
              color: Colors.grey.shade300,
              border: _border,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildText() {
    if (widget.text == null) { return const SizedBox(); }
    return SizedBox(
      height: widget.height,
      child: Center(
        child: AnimatedCrossFade(
          firstChild: Text(
            widget.text!,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          secondChild: Text(
            widget.text!,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),
          ),
          crossFadeState: _sliderRelativePosition > 0.025 ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 200), // Adjust duration as needed
        ),
      ),
    );
  }

  /////////////////////////////////Building the Slider//////////////////////////////////////

  Widget _buildSlider({required double sliderMaxX, required double sliderPositionX}) {
    return Positioned(
      top: widget.height * 0.075,
      left: _animationController.value +  sliderPositionX,
      child: GestureDetector(
        onHorizontalDragStart: (start) {
          if (!widget.enabled) { return; }
          _startedDraggingAtX = sliderPositionX;
          _animationController.stop();
        },
        onHorizontalDragUpdate: (update) {
          if (!widget.enabled) { return; }
          final newSliderPositionX = _startedDraggingAtX + update.localPosition.dx;
          final newSliderRelativePosition = newSliderPositionX / sliderMaxX;
          setState(() { _sliderRelativePosition = max(0, min(1, newSliderRelativePosition)); });
        },
        onHorizontalDragEnd: (end) {
          if (!widget.enabled) { return; }
          if (_sliderRelativePosition == 1.0) {
            widget.onSlided();
          } else {
            reset();
          }
        },
        child: Center(
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(_radius),
              color: widget.enabled ? Colors.white : Theme.of(context).disabledColor,
              border: _border,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5), // Shadow color with opacity
                  blurRadius: 6, // How blurry the shadow is
                  offset: const Offset(-4, 4), // X and Y offset of the shadow
                ),
              ],
            ),
          ),

        ),
      ),
    );
  }

  Radius get _radius => Radius.circular(widget.height);
  Border get _border => Border.all(color: Colors.transparent);
}