import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint_assessment/res/images.dart';
import 'package:moniepoint_assessment/widgets/app_text_field.dart';

class RealEstateHomeScreen extends StatefulWidget {
  const RealEstateHomeScreen({super.key});

  @override
  State<RealEstateHomeScreen> createState() => _RealEstateHomeScreenState();
}

class _RealEstateHomeScreenState extends State<RealEstateHomeScreen>
    with TickerProviderStateMixin {
  bool _visible = false;
  late AnimationController _controller;

  late AnimationController _controller2;
  late AnimationController _textController;
  late Animation<int> _animation;
  late Animation<int> _animation2;
  late Animation<Offset> _slideAnimation;
  late Animation<Offset> _textAnimation;

  final String _text = 'let\'s select your\nperfect place';
  List<String> get lines => _text.split('\n');

  bool _isModalVisible = false;

  @override
  void initState() {
    super.initState();
    Timer(Durations.medium1, () {
      setState(() {
        _visible = true;
      });
    });

    _controller = AnimationController(
      vsync: this,
      duration: Durations.extralong4, // Animation duration
    );

    _controller2 = AnimationController(
      vsync: this,
      duration: Durations.extralong4, // Animation duration
    );

    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500), // Animation duration
    );

    // Define a Tween to count from 0 to 2000
    _animation = IntTween(begin: 100, end: 2212).animate(_controller)
      ..addListener(() {
        setState(() {}); // Rebuild the UI with updated value
      });

    _animation2 = IntTween(begin: 100, end: 1034).animate(_controller)
      ..addListener(() {
        setState(() {}); // Rebuild the UI with updated value
      })
      ..addStatusListener((s) {
        if (s.isCompleted) {
          setState(() {
            _isModalVisible = true;
          });
          _controller2.forward();
        }
      });

    _textAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0), // Starts hidden (below)
      end: const Offset(0.0, 0.0), // Fully visible in place
    ).animate(
        CurvedAnimation(parent: _textController, curve: Curves.easeInOut));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Start off-screen at the bottom
      end: const Offset(0, 0), // End at the center
    ).animate(CurvedAnimation(parent: _controller2, curve: Curves.easeInOut));

    // Start the animation
    _controller.forward();
    _textController.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft, // Start point
            end: Alignment.bottomRight, // End point
            colors: [
              Colors.white, // Starting color
              Colors.orange.shade200, // Ending color
            ],
            stops: const [
              0.18, // White takes up 20%
              1.0, // Orange takes up the rest
            ],
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // search
                          Flexible(
                            flex: 1,
                            fit: FlexFit.loose,
                            child: AppTextField(
                              prefixIcon: const Icon(
                                Icons.location_pin,
                                color: Colors.grey,
                              ),
                              hintText: 'Saint Petersburg',
                            ),
                          ),

                          // profile pic
                          Flexible(
                            child: AnimatedScale(
                              scale: _visible ? 1 : 0,
                              duration: Durations.extralong1,
                              curve: Curves.easeInOut,
                              child: const CircleAvatar(
                                backgroundImage:
                                    AssetImage(AppImages.landscape1),
                              ),
                            ),
                          )
                        ],
                      ),

                      const Gap(20),

                      // hi, name
                      AnimatedOpacity(
                        opacity: _visible ? 1 : 0,
                        duration: Durations.extralong4,
                        child: const Text(
                          'Hi, Marina',
                          style: TextStyle(
                              color: Color(0xffC7BCAE),
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),

                      // intro
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(lines.length, (index) {
                          return ClipRect(
                            child: SlideTransition(
                              position: _textAnimation,
                              child: Text(
                                lines[index],
                                style: const TextStyle(
                                  letterSpacing: -1.5,
                                  color: Colors.black,
                                  fontSize: 35,
                                  height: 0,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          );
                        }),
                      ),

                      const Gap(35),
                      SizedBox(
                        height: 170,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // buy
                            Flexible(
                              child: AnimatedScale(
                                scale: _visible ? 1 : 0,
                                duration: Durations.extralong4,
                                child: Container(
                                  width: 170,
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${_animation2.value}', // Display the animated number
                                        style: const TextStyle(
                                            fontSize: 48,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            const Gap(10),

                            // rent
                            Flexible(
                              child: AnimatedScale(
                                scale: _visible ? 1 : 0,
                                duration: Durations.extralong4,
                                child: Container(
                                  width: 170,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${_animation.value}', // Display the animated number
                                        style: const TextStyle(
                                            fontSize: 48,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // the modal like container, going bottom up
              if (_isModalVisible)
                SlideTransition(
                  position: _slideAnimation,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 500,
                      width: 600,
                      // margin: const EdgeInsets.all(16),
                      // padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              flex: 2,
                              child: _ImageContainer(
                                height: 180,
                                hasMaxWidth: true,
                                address: 'Gladokova St., 25',
                                imageAsset: AppImages.landscape1,
                              ),
                            ),
                            Gap(10),
                            Flexible(
                              flex: 3,
                              child: Row(
                                children: [
                                  Flexible(
                                    child: _ImageContainer(
                                      address: 'Ijegun., 8',
                                      imageAsset: AppImages.landscape2,
                                    ),
                                  ),
                                  Gap(10),
                                  Flexible(
                                    child: Column(
                                      children: [
                                        Flexible(
                                          child: _ImageContainer(
                                            address: 'Ijegun., 8',
                                            imageAsset: AppImages.portrait1,
                                          ),
                                        ),
                                        Gap(10),
                                        Flexible(
                                          child: _ImageContainer(
                                            address: 'Ijegun., 8',
                                            imageAsset: AppImages.portrait2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AnimatedWidthContainer extends StatefulWidget {
  const _AnimatedWidthContainer({
    required this.address,
    this.hasMaxWidth = false,
  });

  final String address;
  final bool hasMaxWidth;

  @override
  State<_AnimatedWidthContainer> createState() => _AnimatedWidthContainerState();
}

class _AnimatedWidthContainerState extends State<_AnimatedWidthContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;
  bool _visible = false;

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..addListener(() {
        if (_widthAnimation.value > 350) {
          _visible = true;
        }
      });

    // Define the width animation (from 50 to 300)
    _widthAnimation = Tween<double>(begin: 50.0, end: 400.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    // Start the animation
    Timer(const Duration(seconds: 1), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _widthAnimation,
      builder: (context, child) {
        return Align(
          alignment: Alignment.bottomLeft,
          child: Stack(
            alignment:
                widget.hasMaxWidth ? Alignment.center : Alignment.centerLeft,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 15,
                    sigmaY: 15,
                  ),
                  child: Container(
                    width: _widthAnimation.value,
                    height: 50.0,
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                    ),
                    child: ClipRRect(
                      child: Container(
                        height: 46,
                        width: 46,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(23)),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 10,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: widget.hasMaxWidth ? 0 : 10.0),
                child: AnimatedOpacity(
                    opacity: _visible ? 1 : 0,
                    duration: Durations.extralong1,
                    child: Text(widget.address)),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ImageContainer extends StatelessWidget {
  const _ImageContainer({
    this.height,
    required this.address,
    required this.imageAsset,
    this.hasMaxWidth = false,
  });

  final double? height;
  // final double width;
  final String address;
  final String imageAsset;
  final bool hasMaxWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      // width: width,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(imageAsset))),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: _AnimatedWidthContainer(
          address: address,
          hasMaxWidth: hasMaxWidth,
        ),
      ),
    );
  }
}
