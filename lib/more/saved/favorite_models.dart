import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';
import './single_model_favorite.dart';

class FAVORITE_MODELS extends StatefulWidget {
  static const routeName = "/saved-models";

  @override
  State<FAVORITE_MODELS> createState() => _FAVORITE_MODELSState();
}

class _FAVORITE_MODELSState extends State<FAVORITE_MODELS> {
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<Barbers>(context).getFavoriteModels();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final modelsData = Provider.of<Barbers>(context);
    final models = modelsData.favoriteModels;
    return SafeArea(
        child: models.length > 0
            ? Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 400,
                        childAspectRatio: 1.1,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5),
                    itemCount: models.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return SINGLE_MODEL_FAVORITE(
                          models[index].id,
                          models[index].sideImage,
                          models[index].name,
                          models[index].type,
                          models[index].forMen,
                          models[index].code,
                          models[index].isFavoriteModel);
                    },
                  ),
                ),
            )
            : Center(
                child: Text(
                  "هیچ مدل مورد علاقه ای افزوده نشده است",
                  style: TextStyle(fontSize: 12),
                ),
              ));
  }
}
