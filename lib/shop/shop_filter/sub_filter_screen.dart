import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:provider/provider.dart';
import '../../../providers/store.dart';
import '../../repetitive_widgets/simple_appbar.dart';
import 'property_list.dart';

class SUB_FILTER_SCREEN extends StatelessWidget {
  final filterSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);
    final subFilterInfo = storeFunc.subFilterInfo;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          title: SIMPLE_APPBAR(""),
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width > 510
                      ? 400
                      : MediaQuery.of(context).size.width / 1.2,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                      controller: filterSearch,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.grey,
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontFamily: "Shabnam"),
                      cursorHeight: 20,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText:
                            "نام محصول اطلاعات محصول و ...".toPersianDigit(),
                        hintStyle: TextStyle(
                          fontSize: 14,
                        ),
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
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: subFilterInfo.length,
                  itemBuilder: (context, index) {
                    return PROPERTY_LIST(
                      subFilterInfo[index]["name"],
                      subFilterInfo[index]["subList"],
                    );
                  }),
            ],
          ),
        ));
  }
}
