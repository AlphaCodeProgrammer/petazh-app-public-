import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import '../../barber/single_barber/request_info/selected_service.dart';
import './turn_model.dart';
import '../../fix/single_back.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'edite_service/edite_service_screen.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:flutter/services.dart';
import './turn_info.dart';
import './turn_dialog.dart';

class TURN_DETAILS_INFO extends StatefulWidget {
  @override
  State<TURN_DETAILS_INFO> createState() => _TURN_DETAILS_INFOState();
}

class _TURN_DETAILS_INFOState extends State<TURN_DETAILS_INFO> {
  final newFloatingPrice = TextEditingController();
  final offPetazhCode = TextEditingController();
  int persianNewFloatingPrice = 0;

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      persianNewFloatingPrice = int.parse(newFloatingPrice.text);
    });
    super.initState();
  }

  void convertToPersianFloatingPrice() {
    setState(() {
      if (newFloatingPrice.text.length > 0) {
        persianNewFloatingPrice = int.parse(newFloatingPrice.text);
      } else {
        persianNewFloatingPrice = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);
    final turnServices = Provider.of<Barbers>(context).turnServices;
    final turnModels = Provider.of<Barbers>(context).turnModels;

    return ListView(
      children: [
        TURN_INFO(),
        SizedBox(
          height: 250,
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
              },
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: turnServices.length,
                  itemBuilder: (context, index) {
                    return SELECTED_SERVICE(
                      turnServices[index]["name"],
                      turnServices[index]["price"],
                      turnServices[index]["floating"],
                      turnServices[index]["offPrice"],
                      turnServices[index]["id"],
                      turnServices[index]["men"],
                      turnServices[index]["ready"],
                      turnServices[index]["off"],
                      turnServices[index]["material"],
                      turnServices[index]["quantity"],
                    );
                  }),
            ),
          ),
        ),
        TURN_DIALOG(),
        turnModels.length > 0
            ? SizedBox(
                height: 400,
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    dragDevices: {
                      PointerDeviceKind.touch,
                      PointerDeviceKind.mouse,
                    },
                  ),
                  child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: turnModels.length,
                      itemBuilder: (context, index) {
                        return TURN_MODEL(
                          turnModels[index]["sideImage"],
                          turnModels[index]["name"],
                          turnModels[index]["code"],
                        );
                      }),
                ),
              )
            : SizedBox(
                height: 5,
              ),
        persianNewFloatingPrice > 0
            ? Align(
                alignment: Alignment.center,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("تومان",
                      style: TextStyle(
                          fontFamily: "Shabnam",
                          fontSize: 10,
                          color: Colors.black87)),
                  Text(
                      persianNewFloatingPrice
                          .toString()
                          .toPersianDigit()
                          .seRagham(),
                      style: TextStyle(
                          fontFamily: "Shabnam",
                          fontSize: 16,
                          color: Colors.blue)),
                ]),
              )
            : SizedBox(
                height: 1,
              ),
        (storeFunc.turnDetails[0]["Accepted"] == true &&
                storeFunc.turnDetails[0]["finished"] == false)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.all(20),
                      child: storeFunc.buttonLoader == false
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(10),
                                fixedSize: const Size(120, 32),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                primary: Color.fromARGB(255, 51, 121, 4),
                              ),
                              onPressed: () {
                                storeFunc.updateFloatingPrice(
                                    persianNewFloatingPrice, context);
                              },
                              child: Text(
                                "افزودن قیمت شناور",
                                style: TextStyle(
                                    fontFamily: "Shabnam", fontSize: 12),
                              ),
                            )
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(10),
                                fixedSize: const Size(120, 32),
                                primary: Color.fromARGB(255, 51, 121, 4),
                              ),
                              onPressed: () {},
                              child: SpinKitThreeBounce(
                                color: Colors.white,
                                size: 15,
                              ),
                            )),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 35,
                      width: 120,
                      child: TextField(
                        controller: newFloatingPrice,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ], // On
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.ltr,
                        cursorColor: Colors.grey,
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                            fontFamily: "Shabnam"),
                        cursorHeight: 20,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: storeFunc.turnDetails[0]["floatingPrice"]
                              .toString()
                              .toPersianDigit()
                              .seRagham(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(192, 192, 192, 1)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(192, 192, 192, 1)),
                          ),
                        ),
                        onChanged: (_) {
                          convertToPersianFloatingPrice();
                        },
                      ),
                    ),
                  ),
                ],
              )
            : SizedBox(
                height: 1,
              ),
        !storeFunc.turnDetails[0]["finished"] &&
                storeFunc.turnDetails[0]["offMoocutCode"].length < 1
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                      padding: EdgeInsets.all(20),
                      child: storeFunc.turnsLoader == false
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                padding: EdgeInsets.all(10),
                                fixedSize: const Size(120, 32),
                              ),
                              onPressed: () {
                                storeFunc.postPetazhOff(offPetazhCode, context);
                              },
                              child: Text(
                                "ثبت کد تخفیف",
                                style: TextStyle(
                                    fontFamily: "Shabnam", fontSize: 12),
                              ),
                            )
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                padding: EdgeInsets.all(10),
                                fixedSize: const Size(120, 32),
                              ),
                              onPressed: () {},
                              child: SpinKitThreeBounce(
                                color: Colors.white,
                                size: 15,
                              ))),
                  Container(
                    height: 35,
                    width: 120,
                    child: TextField(
                      controller: offPetazhCode,
                      cursorColor: Colors.grey,
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                          fontFamily: "Shabnam"),
                      cursorHeight: 20,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.ltr,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: "کد تخفیف",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(192, 192, 192, 1)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(192, 192, 192, 1)),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : SizedBox(
                height: 1,
              )
      ],
    );
  }
}
