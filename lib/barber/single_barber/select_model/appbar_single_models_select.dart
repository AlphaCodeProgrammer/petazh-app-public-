import 'package:flutter/material.dart';
import '../../../fix/single_back.dart';

class APPBAR_SINGLE_MODELS_SELECT extends StatelessWidget {
  final String galleryName;

  @override
  APPBAR_SINGLE_MODELS_SELECT(this.galleryName);
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
        
          Expanded(
            child: SINGLE_BACK(Colors.grey, Colors.white, 50, 50),
            flex: 1,
          ),
            Expanded(
            child: Text(galleryName, style: TextStyle(color: Colors.grey, fontSize: 14),),
            flex: 6,
          ),
        ],
      ),
    );
  }
}
