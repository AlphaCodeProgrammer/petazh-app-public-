import 'package:flutter/material.dart';
import '../more/saved/favorite_barbers.dart';
import '../more/saved/favorite_models.dart';
import '../more/saved/favorite_products.dart';

class BOTTOM_NAVIGATION_FAVORITE extends StatefulWidget {
  const BOTTOM_NAVIGATION_FAVORITE({Key? key}) : super(key: key);

  @override
  State<BOTTOM_NAVIGATION_FAVORITE> createState() =>
      _BOTTOM_NAVIGATION_FAVORITEState();
}

class _BOTTOM_NAVIGATION_FAVORITEState
    extends State<BOTTOM_NAVIGATION_FAVORITE> {
  List<Widget> _pages = [
    FAVORITE_BARBERS(),
    FAVORITE_MODELS(),
    FAVORITE_PRODUCTS(),
  ];
  int selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: _pages[selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // This is all you need!
        onTap: _selectPage,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.cyan,
        currentIndex: selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.store), label: 'آرایشگاه ها'),
          BottomNavigationBarItem(
              icon: Icon(Icons.image_aspect_ratio), label: 'مدل'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_mall), label: 'محصولات'),
        ],
      ),
    ));
  }
}
