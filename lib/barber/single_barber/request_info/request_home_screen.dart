import 'package:flutter/material.dart';
import '../../../repetitive_widgets/simple_appbar.dart';
import 'package:provider/provider.dart';
import '../../../providers/store.dart';
import './selected_service.dart';
import './post_turn_button.dart';
import './text_to_stylist.dart';
import 'package:flutter/gestures.dart';

class REQUEST_HOME_SCREEN extends StatefulWidget {
  @override
  State<REQUEST_HOME_SCREEN> createState() => _REQUEST_HOME_SCREENState();
}

class _REQUEST_HOME_SCREENState extends State<REQUEST_HOME_SCREEN> {
  final String navbar = "نهایی کردن درخواست";
  final textToStylistController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final barberData = Provider.of<Barbers>(context);
    final selecteServices = barberData.services;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: SIMPLE_APPBAR(navbar),
          elevation: 1,
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 9,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    TEXT_TO_STYLIST(textToStylistController),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "خدمات انتخاب شده",
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    // DROPDOWN(),
                    SizedBox(
                      height: 260,
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
                              itemCount: selecteServices.length,
                              itemBuilder: (context, index) {
                                return SELECTED_SERVICE(
                                  selecteServices[index]["name"],
                                  selecteServices[index]["price"],
                                  selecteServices[index]["floating"],
                                  selecteServices[index]["offPrice"],
                                  selecteServices[index]["id"],
                                  selecteServices[index]["men"],
                                  selecteServices[index]["ready"],
                                  selecteServices[index]["off"],
                                  selecteServices[index]["material"],
                                  selecteServices[index]["quantity"],
                                );
                              },
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 1, child: POST_TURN_BUTTON(textToStylistController))
            ],
          ),
        ));
  }
}
