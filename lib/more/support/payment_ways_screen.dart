import 'package:flutter/material.dart';
import '../../repetitive_widgets/simple_appbar.dart';

class PAYMENT_WAYS_SCREEN extends StatelessWidget {
  final String navbarName = "شیوه های پرداخت";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          title: SIMPLE_APPBAR(navbarName),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  "شیوه ی پرداخت به دو صورت امکان پذیر است",
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  "روش اول به صورت آنلاین میباشد که شما با شارژ حساب کاربری خود میتوانید در زمان اتمام نوبت هزینه ی پرداختی از کیف پول شما پرداخت شود",
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  "تنها با پرداخت آنلاین شما میتوانید در صورت داشتن کد تخفیف یا تخفیف کد ارجاع استفاده کنید",
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  "روش دوم روش نقدی میباشد که به صورت حضوری هزینه پرداخت میشود و در صورت داشتن کد تخفیف تخفیفی برای شما اعمال نمیشود",
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ),
            ],
          ),
        ));
  }
}
