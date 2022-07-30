import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import './time_table.dart';

class DROPDOWN extends StatefulWidget {
  @override
  State<DROPDOWN> createState() => _DROPDOWNState();
}

class _DROPDOWNState extends State<DROPDOWN> {
  void timeTable(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      "/time-table",
    );
  }

  @override
  Widget build(BuildContext context) {
    final barberData = Provider.of<Barbers>(context);
    final stylists = barberData.stylistsBarber;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 150,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
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
                        barberData.selectedStylist,
                        style: TextStyle(fontSize: 12, fontFamily: "Shabnam"),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 20,
                      items: stylists
                          .map((item) => DropdownMenuItem<dynamic>(
                                value: item,
                                child: SizedBox(
                                  width: 200,
                                  child: Text(
                                    item["stylistName"],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 12, fontFamily: "Shabnam"),
                                  ),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        barberData.switchStylist(value);
                      },
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.transparent,
                        elevation: 0,
                        primary: Colors.white,
                        fixedSize: const Size(120, 30),
                        padding: EdgeInsets.all(5)),
                    onPressed: () {
                      timeTable(context);
                    },
                    child: Text(
                      "مشاهده جدول زمانی",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "Shabnam",
                          fontSize: 12,
                          color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    colorFilter:
                        ColorFilter.mode(Colors.white, BlendMode.color),
                    image: NetworkImage(barberData.selectedStylistPhoto),
                    fit: BoxFit.cover),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            margin: EdgeInsets.all(5),
            width: 200,
            height: 50,
            child: TextField(
              keyboardType: TextInputType.text,
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,

              // controller: password,
              cursorColor: Colors.grey,
              onChanged: (val) {
                barberData.filterStylistServices(val);
              },

              style: TextStyle(
                  fontSize: 14.0, color: Colors.black, fontFamily: "Shabnam"),
              cursorHeight: 20,
              decoration: InputDecoration(
                hintText: "جست و جوی خدمات",
                hintStyle: TextStyle(fontFamily: "Shabnam", fontSize: 12),
                contentPadding: EdgeInsets.all(10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide:
                      BorderSide(color: Color.fromRGBO(192, 192, 192, 1)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide:
                      BorderSide(color: Color.fromRGBO(192, 192, 192, 1)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
