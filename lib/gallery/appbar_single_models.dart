import 'package:flutter/material.dart';
import '../fix/single_back.dart';

class APPBAR_SINGLE_MODELS extends StatelessWidget {
  final String galleryName;

  @override
  APPBAR_SINGLE_MODELS(this.galleryName);
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SINGLE_BACK(Colors.grey, Colors.white, 50, 50),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              galleryName,
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
