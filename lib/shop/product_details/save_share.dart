import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';

class SAVE_SHARE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);

    return Container(
        child: Row(
      children: [
        storeFunc.productDetails["isFavorite"]
            ? ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white, shadowColor: Colors.transparent),
                onPressed: () {
                  storeFunc.removeProductFormFavorite();
                },
                child: Icon(Icons.bookmark, color: Colors.yellow),
              )
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white, shadowColor: Colors.transparent),
                onPressed: () {
                  storeFunc.addProductToFavorite();
                },
                child: Icon(Icons.bookmark_add_outlined, color: Colors.grey),
              ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.white, shadowColor: Colors.transparent),
            onPressed: () {},
            child: Icon(Icons.share, color: Colors.grey)),
      ],
    ));
  }
}
