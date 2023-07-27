import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:projek/pages/about_page.dart';
import 'package:projek/pages/add_page.dart';
import 'package:projek/pages/more_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  final screens = [const MorePage(), const AddPage(), const AboutPage()];

  @override
  Widget build(BuildContext context) {
    // List of page
    final items = <Widget>[
      const Icon(Icons.home, size: 30),
      const Icon(Icons.align_horizontal_left, size: 30),
      const Icon(Icons.person, size: 30),
    ];

    return Container(
      color: Color.fromARGB(255, 246, 247, 248),
      child: SafeArea(
        top: false,
        child: ClipRect(
          child: Scaffold(
            extendBody: true,
            backgroundColor: Color.fromARGB(255, 244, 245, 245),
            body: screens[index],
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                  iconTheme: const IconThemeData(color: Colors.white)),
              child: CurvedNavigationBar(
                // set duration in animation
                animationCurve: Curves.easeInOut,
                animationDuration: const Duration(milliseconds: 300),
                // setting background color
                color: Color(0xFF283593),
                // setting button hover background color
                buttonBackgroundColor: Color(0xFF283593),
                items: items,
                height: 55,
                index: index,
                backgroundColor: Colors.transparent,
                onTap: (index) => setState(() => this.index = index),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
