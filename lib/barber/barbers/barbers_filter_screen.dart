import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:provider/provider.dart';
import '../../../providers/store.dart';
import '../../repetitive_widgets/simple_appbar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BARBERS_FILTER_SCREEN extends StatelessWidget {
  final searchBox = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final storeFunc = Provider.of<Barbers>(context);
    final cities = storeFunc.filterCities;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          title: SIMPLE_APPBAR("فیلتر و جستو جو"),
        ),
        body: ListView(
          children: [
            Container(
              child: SizedBox(
                width: mediaQueryWidth > 200 ? 300 : mediaQueryWidth / 1.3,
                child:
                    Center(child: Image.asset('assets/images/petazh-logo.png')),
              ),
            ),
            Center(
                child: RichText(
                    text: TextSpan(children: [
              TextSpan(
                  text: "برای ",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Shabnam",
                      fontSize: 10)),
              TextSpan(
                  text: " فیلتر کردن ",
                  style: TextStyle(
                      color: Colors.blue, fontFamily: "Shabnam", fontSize: 10)),
              TextSpan(
                  text:
                      "آرایشگاه ها میتوانید نام بخشی از آدرس  و ... را وارد کنید ",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Shabnam",
                      fontSize: 10)),
            ]))),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                width: 200,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    controller: searchBox,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.grey,
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontFamily: "Shabnam"),
                    cursorHeight: 20,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: "... نام آرایشگاه,آدرس و ".toPersianDigit(),
                      hintStyle: TextStyle(
                        fontSize: 10,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: Color.fromRGBO(192, 192, 192, 1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: Color.fromRGBO(192, 192, 192, 1)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                width: 150,
                child: DropdownButtonFormField<dynamic>(
                  focusColor: Colors.white,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  isExpanded: true,
                  hint: Text(
                    storeFunc.barberCityFilter.isEmpty
                        ? storeFunc.user[0]["city"]
                        : storeFunc.barberCityFilter,
                    style: TextStyle(fontSize: 12, fontFamily: "Shabnam"),
                  ),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black45,
                  ),
                  iconSize: 20,
                  items: cities
                      .map((item) => DropdownMenuItem<dynamic>(
                            value: item,
                            child: Text(
                              item["cityName"],
                              style: const TextStyle(
                                  fontSize: 10, fontFamily: "Shabnam"),
                            ),
                          ))
                      .toList(),
                  onChanged: (city) {
                    storeFunc.changeFilterCityUI(city);
                  },
                  value: cities[storeFunc.cityIndex],
                ),
              ),
            ),
            Center(
              child: Container(
                  padding: EdgeInsets.all(20),
                  child: !storeFunc.buttonLoader
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            primary: Colors.blue,
                          ),
                          onPressed: () {
                            storeFunc.getFilterBarber(searchBox, context);
                          },
                          child: Text(
                            "جست و جو کردن",
                            style:
                                TextStyle(fontFamily: "Shabnam", fontSize: 14),
                          ),
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          onPressed: () {},
                          child: Center(
                              child:SpinKitThreeBounce(
                color: Colors.grey,
                size: 20,
                          )))),
            )
          ],
        ));
  }
}
