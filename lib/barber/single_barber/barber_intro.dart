import 'package:flutter/material.dart';
import '../../fix/single_back.dart';
import '../../repetitive_widgets/rating_star.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class BARBER_INTRO extends StatelessWidget {
  final String barberId;
  BARBER_INTRO(this.barberId);

  @override
  Widget build(BuildContext context) {
    final barberData = Provider.of<Barbers>(context);
    final barberInfo = barberData.barberDetails;

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(1)),
          child: Image.network(barberInfo["barberPhoto"],
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2.5,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SINGLE_BACK(Colors.white, Colors.black12, 50, 50),
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: Color.fromRGBO(0, 0, 0, 0.6),
                        child: Row(
                          children: [
                            barberInfo["isFavorite"]
                                ? TextButton(
                                    onPressed: () {
                                      barberData.postOnDeleteFavoriteBarber();
                                    },
                                    child: Icon(Icons.bookmark,
                                        color: Colors.amber),
                                  )
                                : TextButton(
                                    onPressed: () {
                                      barberData.postFavoriteBarber();
                                    },
                                    child: Icon(
                                      Icons.bookmark_add_outlined,
                                      color: Colors.amber,
                                    ),
                                  ),
                            Text(
                              barberInfo["barberName"]
                                  .toString()
                                  .toPersianDigit(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        color: Color.fromRGBO(0, 0, 0, 0.6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            RATING_STAR(barberInfo["rating"], true, () {}, 1),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              barberInfo["rating"].toString().toPersianDigit(),
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              " :  امتیاز آرایشگاه",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.all(15),
                    padding:
                        EdgeInsets.only(top: 5, right: 2, left: 2, bottom: 2),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.6),
                      border: Border.all(
                        color: Color.fromRGBO(0, 0, 0, 0.6),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    height: 60,
                    child: Text(
                      "${barberInfo["barberCity"]},${barberInfo["barberArea"]},${barberInfo["barberAddress"]}"
                          .toPersianDigit(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
