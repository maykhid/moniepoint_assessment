
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppNavBar extends StatefulWidget {
  const AppNavBar({super.key, required this.isVisible, this.onTapItem});

  final bool isVisible;
  final Function(int)? onTapItem;

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  int _selectedIndex = 2; // Default selected index (e.g., 'house' tab)

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
      if (widget.onTapItem != null) {
        widget.onTapItem!.call(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Durations.extralong4,
      curve: Curves.easeInOut,
      bottom: widget.isVisible ? 0 : -200,
      child: Container(
        margin: const EdgeInsets.only(bottom: 50),
        height: 53,
        width: 230,
        decoration: BoxDecoration(
          color: const Color(0xff2B2B2B),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTabBar(
              icon: FontAwesomeIcons.magnifyingGlass,
              isSelected: _selectedIndex == 0,
              onTap: () => _onTabSelected(0),
            ),
            AppTabBar(
              icon: FontAwesomeIcons.signalMessenger,
              isSelected: _selectedIndex == 1,
              onTap: () => _onTabSelected(1),
            ),
            AppTabBar(
              icon: FontAwesomeIcons.house,
              isSelected: _selectedIndex == 2,
              onTap: () => _onTabSelected(2),
            ),
            AppTabBar(
              icon: Icons.favorite,
              isSelected: _selectedIndex == 3,
              onTap: () => _onTabSelected(3),
            ),
            AppTabBar(
              icon: FontAwesomeIcons.userAstronaut,
              isSelected: _selectedIndex == 4,
              onTap: () => _onTabSelected(4),
            ),
          ],
        ),
      ),
    );
  }
}

class AppTabBar extends StatelessWidget {
  const AppTabBar({
    super.key,
    required this.icon,
    required this.isSelected,
    this.onTap,
  });

  final IconData icon;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: isSelected ? 45 : 35,
        width: isSelected ? 45 : 35,
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange : Colors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }
}
