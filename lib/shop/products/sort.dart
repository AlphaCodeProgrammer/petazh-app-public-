import "package:flutter/material.dart";
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import 'package:flutter/gestures.dart';

class SORT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            height: 35,
            child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                reverse: true,
                itemCount: storeFunc.sortData.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.transparent,
                        primary: Colors.white,
                      ),
                      onPressed: () {
                        storeFunc.changeSort(storeFunc.sortData[index]["name"]);
                      },
                      child: Text(
                        storeFunc.sortData[index]["name"],
                        style: TextStyle(
                            fontFamily: "Shabnam",
                            fontSize: 10,
                            color: storeFunc.sortData[index]["selected"] == true
                                ? Colors.blue
                                : Colors.grey),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
