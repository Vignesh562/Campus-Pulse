import 'package:campuspulse/screens/favorite/favorite_screen.dart';
import 'package:campuspulse/screens/home/home_screen.dart';
import 'package:campuspulse/common/widgets/bottom_navigation.dart';
import 'package:campuspulse/screens/my_ticket/my_ticket_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _controller = PageController(initialPage: 1);
  int currentIndex = 1;

  final pages = [
    FavoriteScreen(),
    HomeScreen(),
    MyTicketScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: pages,

        // when user swipes → update bottom nav
        onPageChanged: (index) {
          setState(() => currentIndex = index);
        },
      ),

      bottomNavigationBar: BottomNavigation(
        selectedIndex: currentIndex,

        // when user taps → animate to page
        onItemTap: (index) {
          setState(() => currentIndex = index);
          _controller.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}
