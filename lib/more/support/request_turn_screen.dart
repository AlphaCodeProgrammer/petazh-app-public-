import 'package:flutter/material.dart';
import '../../repetitive_widgets/simple_appbar.dart';

class REQUEST_TURN_SCREEN extends StatelessWidget {
  final String navbarName = "نحوه ی درخواست";

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
                  ":برای ثبت نوبت مراحل زیر را طی میکنید",
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  "ابتدا اطلاعات کاربری خود رو در بخش پروفایل تکمیل کنید",
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  "سپس با مراجعه به بخش ارایشگاه ها آرایشگاه مورد نظر خود را انتخاب کرده و در قسمت آرایشگر ها (بالا سمت چپ) آرایشگر مورد نظر خود را مشخص نمایید",
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  "سپس خدمات خود را از جدول ذیل انتخاب نمونده و با انتخاب خدمات مجموع قیمت خدمات برای شما نمایش داده میشود",
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  "جدول زمانی آرایشگر مورد نظر و زمان های رزرو شده را چک کنید",
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  "پس از درخواست نوبت به صفحه ی انتخاب مدل ها هدایت شده و مدل های مورد نظر خود را اضافه میکنید",
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  "سپس متن درخواستی از قبیل زمان مراجعه ترجیحی خود و درخواست های بیشتر را اضافه کنید",
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  "سپس آرایشگر با توجه به شرایط شما و زمان مراجعه را مشخص میکند",
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  "پس از اتمام نوبت شما میتوانید به آرایشگر خود امتیاز دهید",
                  style: TextStyle(color: Colors.black87, fontSize: 14),
                ),
              )
            ],
          ),
        ));
  }
}
