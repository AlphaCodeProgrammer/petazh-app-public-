import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import '../products/products_screen.dart';

class CATEGORY_SELECT_TEMPLATE extends StatelessWidget {
  void productGroupRoute(BuildContext ctx) {
    Navigator.of(ctx).pushNamed("/products");
  }

  final List<dynamic> categoryList = [
    {
      "url":
          'https://images.unsplash.com/photo-1558979158-3f28368739e6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8c2hhdmUlMjBtYWNoaW5lfGVufDB8MHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      "title": "لوازم شخصی برقی"
    },
    {
      "url":
          'https://images.unsplash.com/photo-1613235788366-270e7ac489f3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGNvc21ldGljfGVufDB8MHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      "title": "لوازم بهداشتی"
    },
    {
      "url":
          'https://images.unsplash.com/photo-1583209814683-c023dd293cc6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGNvc21ldGljfGVufDB8MHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      "title": "لوازم آرایشی"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...(categoryList).map((item) {
          return InkWell(
            onTap: () {
              productGroupRoute(context);

              storeFunc.getProducts(item["title"], true, true, "", "", "");
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 241, 241, 235),
                  borderRadius: new BorderRadius.all(
                    const Radius.circular(5),
                  )),
              margin: EdgeInsets.only(top: 10, left: 2),
              width: MediaQuery.of(context).size.width / 3.5,
              child: Column(children: [
                Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Image.network(item["url"],
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width / 3.5)),
                Container(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Text(item["title"],
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Shabnam",
                          fontSize: MediaQuery.of(context).size.width > 500
                              ? 14
                              : 8)),
                ),
              ]),
            ),
          );
        }).toList(),
      ],
    );
  }
}
