import 'package:flutter/material.dart';
import '../../repetitive_widgets/simple_appbar.dart';
import '../../fix/buttom_navigations_favorite_screen.dart';

class SAVED_SCREEN extends StatelessWidget {
  final String navbarName = "ذخیره شده";
  static const IconData signpost =
      IconData(0xf0569, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: SIMPLE_APPBAR(navbarName),
      ),
      body: Container(
        color: Colors.white,
        child: BOTTOM_NAVIGATION_FAVORITE(),
      ),
    );
  }
}
