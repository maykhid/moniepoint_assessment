import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:moniepoint_assessment/screens/find_housing_screen.dart';
import 'package:moniepoint_assessment/screens/real_estate_home_screen.dart';
import 'package:moniepoint_assessment/widgets/app_nav_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(
    child: MaterialApp(
        theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
        home: const MainView()),
  ));
}

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  bool _isVisible = false;
  final _controller = PageController(initialPage: 2);

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const FindHousingScreen(),
              Container(color: Colors.orange,),
              const RealEstateHomeScreen(),
              Container(color: Colors.red,),
              Container(color: Colors.cyan,),
            ],
          ),
          AppNavBar(
            isVisible: _isVisible,
            onTapItem: (p0) => _controller.jumpToPage(p0),
          ),
        ],
      ),
    );
  }
}



