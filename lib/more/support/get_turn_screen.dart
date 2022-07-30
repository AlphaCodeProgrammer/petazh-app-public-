import 'package:flutter/material.dart';
import '../../repetitive_widgets/simple_appbar.dart';

class GET_TURN_SCREEN extends StatelessWidget {
  final String navbarName = "مراجعه نوبت ";

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
                  "در صورت تایید و مشخص نموندن زمان مراجعه به آرایشگاه توسط ارایشگر شما باید 5 دقیقه قبل از زمان شروع نوبت در محل حضور داشته باشید",
                  style: TextStyle(color: Colors.black87, fontSize: 12),
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  "پس از اتمام خدمات آرایشگر اقدام به ثبت اتمام نوبت در اپلیکیشن کرده و اقدام به تسویه میکند",
                  style: TextStyle(color: Colors.black87, fontSize: 12),
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  "لطفا قبلا از اقدام آرایشگر به اتمام نوبت کیف پول حساب کاربری شما دارای موجودی کافی باشد زیرا در غیر این صورت باید هزینه به صورت نقدی پرداخت گردد",
                  style: TextStyle(color: Colors.black87, fontSize: 12),
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  "در صورتی که کیف پول حساب کاربری شما دارای موجودی کافی باشد به صورت خودکار تسویه میشود در غیر این صورت باید به صورت نقدی پرداخت کردد",
                  style: TextStyle(color: Colors.black87, fontSize: 12),
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  "پس از اتمام نوبت شما میتوانید به آرایشگر خود امتیاز دهید",
                  style: TextStyle(color: Colors.black87, fontSize: 12),
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  "پس از درخواست نوبت به صفحه ی انتخاب مدل ها هدایت شده و مدل های مورد نظر خود را اضافه میکنید",
                  style: TextStyle(color: Colors.black87, fontSize: 12),
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  "سپس متن درخواستی از قبیل زمان مراجعه ترجیحی خود و درخواست های بیشتر را اضافه کنید",
                  style: TextStyle(color: Colors.black87, fontSize: 12),
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  "سپس آرایشگر با توجه به شرایط شما و زمان مراجعه را مشخص میکند",
                  style: TextStyle(color: Colors.black87, fontSize: 12),
                ),
              ),
              Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  "پس از اتمام نوبت شما میتوانید به آرایشگر خود امتیاز دهید",
                  style: TextStyle(color: Colors.black87, fontSize: 12),
                ),
              )
            ],
          ),
        ));
  }
}
