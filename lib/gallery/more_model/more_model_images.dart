
import 'package:flutter/material.dart';

class MORE_MODEL_IMAGES extends StatelessWidget {
  final String modelImage;
  MORE_MODEL_IMAGES(this.modelImage);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(1)),
            child: Image.network(
              modelImage,
              fit: BoxFit.cover,

            ),
          ),
          // SizedBox(
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height,
          //   child: Column(
          //     children: [
          //       Expanded(
          //         flex: 1,
          //         child: Row(),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
