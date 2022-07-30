import 'package:flutter/material.dart';
import '../../repetitive_widgets/simple_appbar.dart';

class ABOUT_SCREEN extends StatelessWidget {
  static const routeName = "/about";
  final String navbarName = "درباره پیتاژ";

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
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  "پیتاژ پلتفرمی برای رزرو آنلاین نوبت های آرایشگاه ها و سالن های زیبایی میباشد که در سال 1400 هجری شمسی تاسیس شد",
                  style: TextStyle(color: Colors.black87, fontSize: 12),
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  "پیتاژ این امکان را به کاربران خود میدهد که سالن های زیبایی و آرایشگاه های شهر خود را به راحتی پیدا کرده و خدمات مورد نظر آنها را از طریق سایت و اپلیکیشن به سهولت در هر ساعتی از شبانه روز رزرو کنند",
                  style: TextStyle(color: Colors.black87, fontSize: 12),
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  ":از مهمترین اهداف این پلتفرم، می‌توان به موارد زیر اشاره کرد",
                  style: TextStyle(color: Colors.black87, fontSize: 12),
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  " رفع نیاز در جهت خدمات زیبای با سهولت بیشتر ",
                  style: TextStyle(color: Colors.black87, fontSize: 12),
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  "مشاهده قیمت خدمات و انتخابی آسان تر ",
                  style: TextStyle(color: Colors.black87, fontSize: 12),
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  "معرفی آرایشگاه ها و سالن های زیبایی برتر ",
                  style: TextStyle(color: Colors.black87, fontSize: 12),
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  "داشتن گالری جامع از انواع مدل ها و در نتیجه رضایت مندی بیشتر مشتری ",
                  style: TextStyle(color: Colors.black87, fontSize: 12),
                ),
              ),
            ],
          ),
        ));
  }
}
