import 'package:flutter/material.dart';
import '../../repetitive_widgets/simple_appbar.dart';
import '../../repetitive_widgets/change_guid.dart';
import 'usage_screen.dart';
import 'rules_screen.dart';
import 'request_turn_screen.dart';
import 'payment_ways_screen.dart';
import 'get_turn_screen.dart';
import 'error_screen.dart';

class SUPPORT_SCREEN extends StatelessWidget {
  final String navbarName = "پشتیبانی";
  static const IconData signpost =
      IconData(0xf0569, fontFamily: 'MaterialIcons');
  void UsageRoute(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      "/usage",
    );
  }

  void RulesRoute(BuildContext ctx) {
    Navigator.of(ctx).pushNamed("/rules");
  }

  void RequestTurnRoute(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      "/request_turn",
    );
  }

  void PaymentWaysRoute(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      "/payment_ways",
    );
  }

  void GetTurnRoute(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      "/get_turn",
    );
  }

  void ErrorRoute(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      "/error",
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
              CHAGNE_GUID("شرایط استفاده", () {
                UsageRoute(context);
              }, Icons.info_outline, ""),
              CHAGNE_GUID("قوانین و توضیحات", () {
                RulesRoute(context);
              }, Icons.info_outline, ""),
              CHAGNE_GUID("نحوه ی درخواست", () {
                RequestTurnRoute(context);
              }, Icons.info_outline, ""),
              CHAGNE_GUID("شیوه های پرداخت", () {
                PaymentWaysRoute(context);
              }, Icons.info_outline, ""),
              CHAGNE_GUID("نحوه مراجعه نوبت", () {
                GetTurnRoute(context);
              }, Icons.info_outline, ""),
              CHAGNE_GUID("گزارش خطا", () {
                ErrorRoute(context);
              }, Icons.info_outline, "")
            ],
          ),
        ],
      ),
    );
  }
}
