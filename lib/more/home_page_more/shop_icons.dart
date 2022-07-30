import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import './route_avatar.dart';
import '../shop_part/order/order_sending_screen.dart';
import '../shop_part/shopping_basket/SHOPPING_BASKET_SCREEN.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../shop_part/order/order_delivered_screen.dart';
import 'package:flutter/gestures.dart';
import '../shop_part/order/rejected_order/order_rejected_screen.dart';
import '../shop_part/order/cancel_order/order_canceled_screen.dart';

class SHOP_ICONS extends StatelessWidget {
  void WaittingShop(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      "/basket",
    );
  }

  void PostingShop(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      "/sending-orders",
    );
  }

  void DeliveriedShop(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      "/delivered-products",
    );
  }

  void canceledShop(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      "/canceled-orders",
    );
  }

  void rejectedOrders(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      "/rejected-orders",
    );
  }

  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "سفارش های من",
          style: TextStyle(fontSize: 12),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                },
              ),
              child: ListView(
                reverse: true,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      ROUTE_AVATAR("assets/images/waitting.png", "سبد خرید",
                          () {
                        WaittingShop(context);
                      }),
                      SizedBox(
                        width: 10,
                      ),
                      storeFunc.user[0]["cart"].length > 0
                          ? SizedBox(
                              child: ClipOval(
                                child: Container(
                                  color: Colors.red,
                                  padding: EdgeInsets.only(
                                      right: 6, left: 6, top: 2, bottom: 2),
                                  child: Text(
                                    "${storeFunc.user[0]["cart"].length}"
                                        .toString()
                                        .toPersianDigit(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(
                              width: 1,
                            ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 65,
                    child: VerticalDivider(
                      color: Colors.grey,
                      thickness: 0.5,
                      indent: 5,
                      endIndent: 0,
                      width: 20,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ROUTE_AVATAR("assets/images/posting.png", "در حال ارسال", () {
                    PostingShop(context);
                  }),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 65,
                    child: VerticalDivider(
                      color: Colors.grey,
                      thickness: 0.5,
                      indent: 5,
                      endIndent: 0,
                      width: 20,
                    ),
                  ),
                  ROUTE_AVATAR("assets/images/deliveried.png", "تحویل داده شده",
                      () {
                    DeliveriedShop(context);
                  }),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 65,
                    child: VerticalDivider(
                      color: Colors.grey,
                      thickness: 0.5,
                      indent: 5,
                      endIndent: 0,
                      width: 20,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ROUTE_AVATAR("images/cancel.png", "لغو شده", () {
                    canceledShop(context);
                  }),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 65,
                    child: VerticalDivider(
                      color: Colors.grey,
                      thickness: 0.5,
                      indent: 5,
                      endIndent: 0,
                      width: 20,
                    ),
                  ),
                  ROUTE_AVATAR("images/reject.png", "مرجوعی", () {
                    rejectedOrders(context);
                  }),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
