import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import '../product_details/product_details_screen.dart';

class SEARCH_PRODUCTS_TEMPLATE extends StatelessWidget {
  String _id;
  String productName;
  List<dynamic> images;

  SEARCH_PRODUCTS_TEMPLATE(
    this._id,
    this.productName,
    this.images,
  );

  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);
    final deviceSize = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              "/product/${_id}",
            );
            // storeFunc.getProductDetailsInfo(_id, context);
          },
          child: SizedBox(
            width: deviceSize > 700 ? 240 : 120,
            child: Card(
                elevation: 5,
                child: Column(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    child: Image.network(
                      images[0],
                      fit: BoxFit.fitHeight,
                      width: 100,
                      height: 120,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Container(
                      child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: deviceSize > 500
                              ? Text(
                                  productName.length > 30
                                      ? "${productName.substring(0, 30)}..."
                                      : "${productName.substring(0, productName.length)}",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontFamily: "Shabnam",
                                      fontSize: 12,
                                      color: Colors.black))
                              : Text(
                                  productName.length > 25
                                      ? "${productName.substring(0, 25)}..."
                                      : "${productName.substring(0, productName.length)}",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontFamily: "Shabnam",
                                      fontSize: 12,
                                      color: Colors.black))),
                    ),
                  ),
                ])),
          ),
        ),
      ),
    );
  }
}
