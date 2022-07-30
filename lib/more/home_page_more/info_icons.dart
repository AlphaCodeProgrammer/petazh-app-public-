import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './route_avatar.dart';
import '../../providers/store.dart';

class INFO_ICONS extends StatelessWidget {
  void ProfileRoute(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      "/profile",
    );
  }

  void TurnRoute(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      "/turn",
    );
  }

  void SavedRoute(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      "/saved",
    );
  }

  void SupportRoute(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      "/support",
    );
  }

  void AboutusRoute(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      "/aboutus",
    );
  }

  void WalletRoute(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      "/wallet",
    );
  }

  void ratingScreen(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      "/rating",
    );
  }

  void ratingOrders(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      "/unrated-orders",
    );
  }

  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 7,
              child: ROUTE_AVATAR("assets/images/wallet.png", "کیف پول", () {
                WalletRoute(context);
              }),
            ),
            Expanded(
              flex: 7,
              child: ROUTE_AVATAR("assets/images/turn.png", "نوبت ها", () {
                TurnRoute(context);
              }),
            ),
            Expanded(
              flex: 7,
              child: ROUTE_AVATAR("assets/images/profile.png", "پروفایل", () {
                ProfileRoute(context);
              }),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              flex: 7,
              child: ROUTE_AVATAR("assets/images/info.png", "دربارما", () {
                AboutusRoute(context);
              }),
            ),
            Expanded(
              flex: 7,
              child: ROUTE_AVATAR("assets/images/support.png", "پشتیبانی", () {
                SupportRoute(context);
              }),
            ),
            Expanded(
              flex: 7,
              child:
                  ROUTE_AVATAR("assets/images/bookmark.png", "ذخیره شده", () {
                SavedRoute(context);
              }),
            ),
          ],
        ),
        Row(
          children: [
            storeFunc.unratedTurns.length > 0
                ? Expanded(
                    flex: 7,
                    child: ROUTE_AVATAR("images/rating.png", "امتیاز دهی", () {
                      ratingScreen(context);
                    }),
                  )
                : SizedBox(
                    width: 1,
                  ),
            storeFunc.unratedOrders.length > 0
                ? Expanded(
                    flex: 7,
                    child: ROUTE_AVATAR(
                        "images/product-rating.png", "امتیاز محصولات", () {
                      ratingOrders(context);
                    }),
                  )
                : SizedBox(
                    width: 1,
                  ),
          ],
        ),
      ],
    );
  }
}
