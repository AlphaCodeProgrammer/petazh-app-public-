import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';

class SINGLE_MODEL_FAVORITE extends StatelessWidget {
  final String id;
  final List<dynamic> sideImage;
  final String name;
  final String type;
  final bool forMen;
  final String code;
  final bool isFavoriteModel;

  @override
  SINGLE_MODEL_FAVORITE(this.id, this.sideImage, this.name, this.type, this.forMen,
      this.code, this.isFavoriteModel);

  @override
  Widget build(BuildContext context) {
    final barberData = Provider.of<Barbers>(context);

    return Container(
      child: Center(
        child: SizedBox(
          width: 400,
          child: Container(
            margin: EdgeInsets.all(20),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: InkWell(
                    child: Image.network(
                      sideImage[0],
                      fit: BoxFit.cover,
                      width: 400,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              color: Color.fromRGBO(9, 0, 0, 0.6),
                              child: Text(
                                name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              color: Color.fromRGBO(9, 0, 0, 0.6),
                              child: Text(
                                code,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              child: isFavoriteModel
                                  ? TextButton(
                                      onPressed: () {
                                        barberData.postOnDeleteFavoriteModel({
                                          "id": id,
                                          "sideImage": sideImage,
                                          "name": name,
                                          "type": type,
                                          "forMen": forMen,
                                          "code": code,
                                          "isFavoriteModel": isFavoriteModel,
                                          "models": false
                                        });
                                      },
                                      child: Icon(Icons.bookmark,
                                          color: Colors.amber))
                                  : TextButton(
                                      onPressed: () {
                                        barberData.postFavoriteModel({
                                          "id": id,
                                          "sideImage": sideImage,
                                          "name": name,
                                          "type": type,
                                          "forMen": forMen,
                                          "code": code,
                                          "isFavoriteModel": isFavoriteModel,
                                          "models": false
                                        });
                                      },
                                      child: Icon(Icons.bookmark_add_outlined,
                                          color: Colors.amber)))
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
