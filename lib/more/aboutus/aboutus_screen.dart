import 'package:flutter/material.dart';
import '../../repetitive_widgets/simple_appbar.dart';
import '../../repetitive_widgets/change_guid.dart';
import './about_screen.dart';
import './contact_us_screen.dart';

class ABOUTUS_SCREEN extends StatelessWidget {
  final String navbarName = "دربارما";
  static const IconData signpost =
      IconData(0xf0569, fontFamily: 'MaterialIcons');

  void AboutRoute(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      "/about",
    );
  }

  void ContactUsRoute(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      "/contact-us",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: SIMPLE_APPBAR(navbarName),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              CHAGNE_GUID("درباره پیتاژ", () {
                AboutRoute(context);
              }, Icons.info, ""),
              CHAGNE_GUID("ارتباط با ما", () {
                ContactUsRoute(context);
              }, Icons.info, ""),
            ],
          ),
        ],
      ),
    );
  }
}
