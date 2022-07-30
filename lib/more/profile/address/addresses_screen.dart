import '../address/add_address.dart';
import 'package:flutter/material.dart';
import '../../../repetitive_widgets/simple_appbar.dart';
import 'package:provider/provider.dart';
import '../../../providers/store.dart';
import './address_template.dart';

class ADDRESSES_SCREEN extends StatelessWidget {
  final newAddress = TextEditingController();
  final newPostalCode = TextEditingController();
  void addAddress(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      "/add-address",
    );
  }

  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);
    final users = storeFunc.user;
    final cities = storeFunc.cities;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: SIMPLE_APPBAR("آدرس ها"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "شهر پیشفرض",
              style: TextStyle(
                  fontFamily: "Shabnam", fontSize: 10, color: Colors.grey),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 150,
                  child: DropdownButtonFormField<dynamic>(
                    focusColor: Colors.white,
                    decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    isExpanded: true,
                    hint: Text(
                      storeFunc.user[0]["city"].length < 1
                          ? storeFunc.selectedBarberCity
                          : storeFunc.user[0]["city"],
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
                      storeFunc.changeUserCity(city);
                    },
                    // value: cities[userData.cityIndex],
                  )),
            ],
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "آدرس های من",
              style: TextStyle(
                  fontFamily: "Shabnam", fontSize: 10, color: Colors.grey),
            ),
          ),
          Expanded(
              child: users[0]["address"].length > 0
                  ? Directionality(
                      textDirection: TextDirection.rtl,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 350,
                            mainAxisExtent: 300,
                            childAspectRatio: 1.2,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5),
                        itemCount: users[0]["address"].length,
                        itemBuilder: (BuildContext ctx, index) {
                          return ADDRESS_TEMPLATE(
                            users[0]["address"][index]["_id"],
                            users[0]["address"][index]["city"],
                            users[0]["address"][index]["postalCode"],
                            users[0]["address"][index]["address"],
                            users[0]["address"][index]["reciverName"],
                            users[0]["address"][index]["reciverPhone"],
                          );
                        },
                      ),
                    )
                  : Center(
                      child: Text(
                      "آدرسی موجود نیست",
                      style: TextStyle(fontFamily: "Shabnam", fontSize: 12),
                    ))),
          Container(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: EdgeInsets.all(10),
                  fixedSize: const Size(100, 38),
                ),
                onPressed: () {
                  addAddress(context);
                },
                child: Text(
                  "افزدون آدرس",
                  style: TextStyle(fontFamily: "Shabnam", fontSize: 12),
                ),
              )),
        ],
      ),
    );
  }
}
