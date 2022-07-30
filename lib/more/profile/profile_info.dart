import 'package:flutter/material.dart';
import '../../more/profile/change_email_screen.dart';
import '../../more/profile/change_name_screen.dart';
import './address/addresses_screen.dart';
import '../../repetitive_widgets/simple_appbar.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../repetitive_widgets/change_guid.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';

class PROFILE_INFO extends StatefulWidget {
  static const IconData signpost =
      IconData(0xf0569, fontFamily: 'MaterialIcons');

  @override
  State<PROFILE_INFO> createState() => _PROFILE_INFOState();
}

class _PROFILE_INFOState extends State<PROFILE_INFO> {
  void ChangeName(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      "/change-name",
    );
  }

  void ChangeEmail(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      "/change-email",
    );
  }

  void ChangeAddress(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      "/adresses",
    );
  }

  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<Barbers>(context).getProfile(context, false);
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<Barbers>(context);
    final users = userData.user;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: SIMPLE_APPBAR("پروفایل"),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
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
              SizedBox(
                height: 10,
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
                height: 10,
              ),
              CHAGNE_GUID("ویرایش اطلاعات کاربری", () {
                ChangeName(context);
              }, Icons.person, users[0]["username"]),
              CHAGNE_GUID("شماره تلفن ( تایید شده)", () {}, Icons.phone_android,
                  users[0]["phone"].toString().toPersianDigit()),
              CHAGNE_GUID("ایمیل", () {
                ChangeEmail(context);
              }, Icons.email, users[0]["email"]),
              CHAGNE_GUID("آدرس و کد پستی", () {
                ChangeAddress(context);
              },
                  Icons.post_add,
                  users[0]["address"].length > 0
                      ? "${users[0]["address"][0]["city"]} ${users[0]["address"][0]["address"]}"
                      : "")
            ],
          ),
        ],
      ),
    );
  }
}
