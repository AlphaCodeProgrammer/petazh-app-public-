import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import '../../barber/barbers/barber_card.dart';

class FAVORITE_BARBERS extends StatefulWidget {
  static const routeName = "/saved-barbers";

  @override
  State<FAVORITE_BARBERS> createState() => _FAVORITE_BARBERSState();
}

class _FAVORITE_BARBERSState extends State<FAVORITE_BARBERS> {
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<Barbers>(context).getFavoriteBarber();
    }
    _isInit = false;
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    final barbersData = Provider.of<Barbers>(context);
    final FavoriteBarbers = barbersData.FavoriteBarbers;

    return SafeArea(
        child: FavoriteBarbers.length > 0
            ? Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 400,
                        childAspectRatio: 1.5,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5),
                    itemCount: FavoriteBarbers.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return BARBER_CARD(
                        FavoriteBarbers[index].id,
                        FavoriteBarbers[index].barberName,
                        FavoriteBarbers[index].rating,
                        FavoriteBarbers[index].barberPhoto,
                        FavoriteBarbers[index].forMen,
                        FavoriteBarbers[index].barberCity,
                        FavoriteBarbers[index].barberArea,
                      );
                    },
                  ),
                ),
            )
            : Center(
                child: Text(
                  "هیچ آرایشگاه مورد علاقه ای افزوده نشده است",
                  style: TextStyle(fontSize: 12),
                ),
              ));
  }
}
