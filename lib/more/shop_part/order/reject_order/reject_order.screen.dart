import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../../../../providers/store.dart';
import '../../../../repetitive_widgets/simple_appbar.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../order_product_mobile_template.dart';
import '../order_product_template.dart';
import 'package:flutter/gestures.dart';
import './product_reject_template.dart';

class REJECT_ORDER_SCREEN extends StatefulWidget {
  @override
  State<REJECT_ORDER_SCREEN> createState() => _REJECT_ORDER_SCREENState();
}

void toSelectTimeRoute(BuildContext ctx) {}

class _REJECT_ORDER_SCREENState extends State<REJECT_ORDER_SCREEN> {
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    super.initState();
  }

  final explain = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      //your code goes here
    });
    final storeFunc = Provider.of<Barbers>(context);
    final readyRejectProducts = storeFunc.readyRejectProducts;
    final singleOrder = storeFunc.singleOrder;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          title: SIMPLE_APPBAR(
              "${singleOrder["specialId"]}  شماره سفارش :".toPersianDigit()),
        ),
        body: storeFunc.orderProductsLoader == false
            ? storeFunc.orderProductsLoader == false &&
                    storeFunc.readyRejectProducts.length == 0
                ? Center(
                    child: Text(
                    "این سفارش موجود نمیباشد",
                    style: TextStyle(
                        fontFamily: "Shabnam",
                        fontSize: 10,
                        color: Colors.black),
                  ))
                : ListView(
                    children: [
                      Column(
                        children: [
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Column(children: [
                              Container(
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.red),
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "کاربر گرامی برای مرجوع کردن کالا ها لطفا مراحل و شرایط زیر را به دقت برسی کنید"
                                      .toPersianDigit(),
                                  maxLines: 4,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.red,
                                      fontFamily: "Shabnam"),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ]),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.green),
                                borderRadius: BorderRadius.circular(10)),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                "مرحله اول : مورد مرجوعی شما باید یکی از موارد زیر باشد"
                                    .toPersianDigit(),
                                maxLines: 4,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.green,
                                    fontFamily: "Shabnam"),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "موارد مرجوعی کالا در پیتاژ"
                                        .toPersianDigit(),
                                    maxLines: 4,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontFamily: "Shabnam"),
                                  ),
                                ),
                                Text(
                                  "اصل نبودن کالا - ".toPersianDigit(),
                                  maxLines: 4,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromARGB(255, 231, 122, 114),
                                      fontFamily: "Shabnam"),
                                ),
                                Text(
                                  " آسیب فیزیکی محصول - ".toPersianDigit(),
                                  maxLines: 4,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromARGB(255, 231, 122, 114),
                                      fontFamily: "Shabnam"),
                                ),
                                Text(
                                  " عدم تطابق کالا - ".toPersianDigit(),
                                  maxLines: 4,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromARGB(255, 231, 122, 114),
                                      fontFamily: "Shabnam"),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.green),
                                borderRadius: BorderRadius.circular(10)),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                "مرحله دوم : خواندن اطلاعات مربوط به مرجوعی و اعبار سنجی کالای مرجوعی"
                                    .toPersianDigit(),
                                maxLines: 10,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.green,
                                    fontFamily: "Shabnam"),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "اعتبار سنجی ".toPersianDigit(),
                                    maxLines: 4,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.blue,
                                        fontFamily: "Shabnam"),
                                  ),
                                ),
                                Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Text(
                                    "- در صورتی که در دسته بندی لوازم آرایشی و بهداشتی باشد نباید پلمپ آن باز شده باشد  "
                                        .toPersianDigit(),
                                    maxLines: 10,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black87,
                                        fontFamily: "Shabnam"),
                                  ),
                                ),
                                Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Text(
                                    "- بسته بندی محصول نباید آسیب دیده باشد  ",
                                    maxLines: 10,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black87,
                                        fontFamily: "Shabnam"),
                                  ),
                                ),
                                Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Text(
                                    "- درصورتی که درخواست مرجوعی شما برای اصل نبودن کالا باشد لطفا از بابت آن مطمین شوید زیرا در صورت محرز نشدن اصل نبودن محصول هزینه ی ارسال به عهده مشتری میباشد  ",
                                    maxLines: 10,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black87,
                                        fontFamily: "Shabnam"),
                                  ),
                                ),
                                Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Text(
                                    "- درصورتی که درخواست مرجوعی برای عدم تطابق کالا  باشد لطفا ابتدا با واحد پشتیبانی  تماس حاصل فرمایید ",
                                    maxLines: 10,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black87,
                                        fontFamily: "Shabnam"),
                                  ),
                                ),
                                Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Text(
                                    "توجه : درصورتی که باکس ارسالی توسط پیتاژ در زمان تحویل آسیب دیده بود از سلامت کالاهای موجود در آن اطمینان حاصل فرماید زیرا کالا ها در زمان تحویل از فروشنده به طور کامل از نظر سلامت فیزیکی تست شده و درصورتی که این آسیب ها در اثر ضربه باشند فرایند توسط اداره پست پی گیری خواهد شد ",
                                    maxLines: 10,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.red,
                                        fontFamily: "Shabnam"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "انتخاب محصول مرجوعی",
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 157, 158, 158),
                                fontFamily: "Shabnam"),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: Container(
                              child: TextField(
                                textAlign: TextAlign.right,
                                controller: explain,
                                maxLines: 8,
                                cursorColor: Colors.grey,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                    fontFamily: "Shabnam"),
                                cursorHeight: 20,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  hintText: "",
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(192, 192, 192, 1)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(192, 192, 192, 1)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: SizedBox(
                                    height: 320,
                                    child: ScrollConfiguration(
                                      behavior: ScrollConfiguration.of(context)
                                          .copyWith(
                                        dragDevices: {
                                          PointerDeviceKind.touch,
                                          PointerDeviceKind.mouse,
                                        },
                                      ),
                                      child: ListView.builder(
                                        physics: ClampingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: readyRejectProducts.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return PRODUCT_REJECT_TEMPLATE(
                                            readyRejectProducts[index]
                                                ["productId"],
                                            readyRejectProducts[index]
                                                ["productName"],
                                            readyRejectProducts[index]
                                                ["rejectQuantity"],
                                            readyRejectProducts[index]
                                                ["productImage"],
                                            readyRejectProducts[index]
                                                ["shopNameSeller"],
                                            readyRejectProducts[index]
                                                ["sellerId"],
                                            readyRejectProducts[index]["color"],
                                            readyRejectProducts[index]
                                                ["colorName"],
                                            readyRejectProducts[index]
                                                ["quantity"],
                                            readyRejectProducts[index]["value"],
                                            readyRejectProducts[index]["group"],
                                          );
                                        },
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                          storeFunc.rejectionProducts.length > 0
                              ? Container(
                                  width: 150,
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.red),
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsets.all(5),
                                  child: storeFunc.buttonLoader == false
                                      ? ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shadowColor: Colors.transparent,
                                              elevation: 0,
                                              primary: Colors.transparent,
                                              padding: EdgeInsets.all(5)),
                                          onPressed: () {
                                            storeFunc.sendRejectionRequest(
                                                explain.text, context);
                                          },
                                          child: Align(
                                            child: Text(
                                              "تایید درخواست مرجوعی",
                                              style: TextStyle(
                                                  fontFamily: "Shabnam",
                                                  fontSize: 12,
                                                  color: Colors.red),
                                            ),
                                          ),
                                        )
                                      : ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shadowColor: Colors.transparent,
                                              elevation: 0,
                                              primary: Colors.transparent,
                                              padding: EdgeInsets.all(5)),
                                          onPressed: () {},
                                          child: SpinKitThreeBounce(
                                            color: Colors.red,
                                            size: 20,
                                          )))
                              : SizedBox(
                                  width: 1,
                                )
                        ],
                      ),
                    ],
                  )
            : Center(
                child: SpinKitThreeBounce(
                color: Colors.grey,
                size: 20,
              )));
  }
}
