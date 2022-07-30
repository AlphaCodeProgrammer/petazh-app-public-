import 'package:flutter/material.dart';
import "../gallery/home_page_gallry_screen.dart";
import '../barber/barbers/barbers_screen.dart';
import '../shop/shop_home/shop_home_screen.dart';
import '../more/home_page_more/more_screen.dart';
import 'package:provider/provider.dart';
import '../providers/store.dart';
import '../RegLog/login/login.dart';
import '../repetitive_widgets/loading.dart';

class BOTTOM_NAVIGATION extends StatefulWidget {
  @override
  State<BOTTOM_NAVIGATION> createState() => _BOTTOM_NAVIGATIONState();
}

class _BOTTOM_NAVIGATIONState extends State<BOTTOM_NAVIGATION> {
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Barbers>(context, listen: false).tryAutoLogin(true);
    });
    super.initState();
  }

  List<Widget> _pages = [
    MORE_SCREEN(),
    SHOP_HOME_SCREEN(),
    HOME_PAGE_GALLERY_SCREEN(),
    BARBERS_SCREEN(),
  ];
  int selectedPageIndex = 3;
  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);

    return storeFunc.token.contains("Bearer")
        ? storeFunc.userId.length > 5
            ? SafeArea(
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
                    const BottomNavigationBarItem(
                        icon: Icon(Icons.more_horiz), label: 'بیشتر'),
                    const BottomNavigationBarItem(
                        icon: Icon(Icons.local_mall), label: 'فروشگاه'),
                    const BottomNavigationBarItem(
                        icon: Icon(Icons.image_aspect_ratio), label: 'گالری'),
                    const BottomNavigationBarItem(
                        icon: Icon(Icons.store), label: 'آرایشگاه ها'),
                  ],
                ),
              ))
            : LOADING()
        : LOGIN();
  }
}
