import 'package:flutter/material.dart';
import './shop_icons.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import './info_icons.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import '../anns/ann_screen.dart';

class MORE_SCREEN extends StatefulWidget {
  @override
  State<MORE_SCREEN> createState() => _MORE_SCREENState();
}

class _MORE_SCREENState extends State<MORE_SCREEN> {
  void annRoute(BuildContext ctx) {
    Navigator.of(ctx).pushNamed("/anns");
  }

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Barbers>(context, listen: false).getProfile(context, false);
      Provider.of<Barbers>(context, listen: false).getUnratedTurns();
      Provider.of<Barbers>(context, listen: false).getUnratedProducts();
      Provider.of<Barbers>(context, listen: false).getAnn();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<Barbers>(context);
    final users = userData.user;
    return ListView(
      children: [
        Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  annRoute(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20),
                  shadowColor: Colors.white,
                  primary: Colors.white,
                  shape: CircleBorder(),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.notifications,
                      color: Colors.grey,
                    ),
                    userData.notificationSign != 0
                        ? Container(
                            child: ClipOval(
                              child: Container(
                                color: Colors.red,
                                padding: EdgeInsets.only(right: 5, left: 5),
                                child: Text(
                                  userData.notificationSign
                                      .toString()
                                      .toPersianDigit(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ),
                            ),
                          )
                        : SizedBox(
                            height: 1,
                          )
                  ],
                ))
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(users[0]["userPhoto"]),
                            fit: BoxFit.fill),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      users[0]["phone"].toString().toPersianDigit(),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(users[0]["username"]),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SHOP_ICONS(),
            SizedBox(
              height: 30,
              width: 200,
              child: Divider(
                color: Colors.grey,
                thickness: 0.5,
                indent: 5,
                endIndent: 0,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            INFO_ICONS(),
          ],
        ),
      ],
    );
  }
}
