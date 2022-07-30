import 'package:flutter/material.dart';
import '../../../repetitive_widgets/simple_appbar.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:provider/provider.dart';
import '../../../providers/store.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/services.dart';

class ADD_ADDRESS_SCREEN extends StatefulWidget {
  @override
  State<ADD_ADDRESS_SCREEN> createState() => _ADD_ADDRESS_SCREENState();
}

class _ADD_ADDRESS_SCREENState extends State<ADD_ADDRESS_SCREEN> {
  final newAddress = TextEditingController();

  final newPostalCode = TextEditingController();

  final newReciverName = TextEditingController();

  final newReciverPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<Barbers>(context);
    final cities = userData.cities;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: SIMPLE_APPBAR("آدرس و کد پستی"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "لطفا آدرس و کد پستی  خود را واردبه درستی کنید",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
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
                          userData.user[0]["city"].length < 1
                              ? userData.selectedBarberCity
                              : userData.user[0]["city"],
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
                          userData.changeCity(city);
                        },
                        // value: cities[userData.cityIndex],
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "کد پستی",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 200,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ], // On
                      textAlign: TextAlign.right,
                      controller: newPostalCode,
                      cursorColor: Colors.grey,
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontFamily: "Shabnam"),
                      cursorHeight: 20,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: "".toString().toPersianDigit(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(192, 192, 192, 1)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(192, 192, 192, 1)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "آدرس",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width > 500
                        ? MediaQuery.of(context).size.width / 2
                        : MediaQuery.of(context).size.width,
                    child: TextField(
                      textAlign: TextAlign.right,
                      controller: newAddress,
                      maxLines: 4,
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
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(192, 192, 192, 1)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(192, 192, 192, 1)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "نام و نام خانوادگی گیرنده",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 200,
                    child: TextField(
                      textAlign: TextAlign.right,
                      controller: newReciverName,
                      cursorColor: Colors.grey,
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontFamily: "Shabnam"),
                      cursorHeight: 20,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: "".toString().toPersianDigit(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(192, 192, 192, 1)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(192, 192, 192, 1)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "شماره تلفن گیرنده",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 200,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ], // On
                      textAlign: TextAlign.right,
                      controller: newReciverPhone,
                      maxLines: 1,
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
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(192, 192, 192, 1)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(192, 192, 192, 1)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
                padding: EdgeInsets.all(20),
                child: !userData.buttonLoader
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          padding: EdgeInsets.all(10),
                          fixedSize: const Size(100, 38),
                        ),
                        onPressed: () {
                          userData.addAddress(newAddress, newPostalCode,
                              newReciverName, newReciverPhone, context);
                        },
                        child: Text(
                          "ثبت آدرس",
                          style: TextStyle(fontFamily: "Shabnam", fontSize: 12),
                        ),
                      )
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          padding: EdgeInsets.all(10),
                          fixedSize: const Size(100, 38),
                        ),
                        onPressed: () {},
                        child: SpinKitThreeBounce(
                          color: Colors.white,
                          size: 15,
                        ))),
          ),
        ],
      ),
    );
  }
}
