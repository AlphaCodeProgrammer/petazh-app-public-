import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RATING_STAR extends StatelessWidget {
  final double ratingPoint;
  final bool getIgnore;
  final Function setRatingPoint;
  final int startCount;
  RATING_STAR(
      this.ratingPoint, this.getIgnore, this.setRatingPoint, this.startCount);
  @override
  Widget build(BuildContext context) {
    return RatingBar(
      onRatingUpdate: (star) => setRatingPoint(star),
      ignoreGestures: getIgnore,
      initialRating: ratingPoint,
      itemSize: 20,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: startCount,
      ratingWidget: RatingWidget(
          full:
              const Icon(Icons.star, color: Color.fromARGB(255, 255, 179, 14)),
          half: const Icon(
            Icons.star_half_sharp,
            color: Color.fromARGB(255, 255, 179, 14),
          ),
          empty: const Icon(
            Icons.star_outline,
            color: Colors.orange,
          )),
    );
  }
}
