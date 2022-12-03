import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:meditation/screens/home_screen.dart';
import 'package:meditation/screens/CartScreen.dart';
import 'package:meditation/screens/session_screen.dart';

class ContainerScreen extends StatefulWidget {
  const ContainerScreen({super.key});

  @override
  State<ContainerScreen> createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> {
  int selectedTabBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe5fffc),
      body: selectedTabBarIndex == 0
          ? const HomeScreen()
          : selectedTabBarIndex == 1
              ? const SessionScreen()
              : const CartScreen(),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.white,
        color: const Color(0xff1A7F72),
        height: 58,
        activeColor: const Color(0xff1A7F72),
        cornerRadius: 0,
        initialActiveIndex: 0,
        items: const [
          TabItem(title: 'Home', icon: Icons.house_sharp),
          TabItem(title: 'Session', icon: Icons.list_alt_sharp),
          TabItem(title: 'Cart', icon: Icons.shop_sharp),
        ],
        onTap: (int i) {
          selectedTabBarIndex = i;
          setState(() {});
        },
      ),
    );
  }
}
