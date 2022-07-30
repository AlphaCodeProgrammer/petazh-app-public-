import 'package:flutter/material.dart';
import '../../gallery/more_model/more_model_screen.dart';
import 'package:provider/provider.dart';
import '../providers/store.dart';

class SINGLE_MODEL extends StatefulWidget {
  final String id;
  final List<dynamic> sideImage;
  final String name;
  final String type;
  final bool forMen;
  final String code;
  final bool isFavoriteModel;

  @override
  SINGLE_MODEL(this.id, this.sideImage, this.name, this.type, this.forMen,
      this.code, this.isFavoriteModel);

  @override
  State<SINGLE_MODEL> createState() => _SINGLE_MODELState();
}

class _SINGLE_MODELState extends State<SINGLE_MODEL> {
  void pushToMoreImages(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      "/more-model-images",
    );
  }

  Widget build(BuildContext context) {
    final storeData = Provider.of<Barbers>(context);

    return Container(
      child: Center(
        child: SizedBox(
          width: 500,
          child: Container(
            margin: EdgeInsets.all(2),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                  child: InkWell(
                    onTap: () {
                      storeData.moreModelImages(
                          widget.sideImage, widget.name, widget.code);
                      pushToMoreImages(context);
                    },
                    child: Image.network(
                      widget.sideImage[0],
                      fit: BoxFit.cover,
                      width: 500,
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
                                widget.name,
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
                                widget.code,
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
                              child: widget.isFavoriteModel
                                  ? TextButton(
                                      onPressed: () {
                                        storeData.postOnDeleteFavoriteModel({
                                          "id": widget.id,
                                          "sideImage": widget.sideImage,
                                          "name": widget.name,
                                          "type": widget.type,
                                          "forMen": widget.forMen,
                                          "code": widget.code,
                                          "isFavoriteModel":
                                              widget.isFavoriteModel,
                                          "models": true
                                        });
                                      },
                                      child: Icon(Icons.bookmark,
                                          color: Colors.amber))
                                  : TextButton(
                                      onPressed: () {
                                        storeData.postFavoriteModel({
                                          "id": widget.id,
                                          "sideImage": widget.sideImage,
                                          "name": widget.name,
                                          "type": widget.type,
                                          "forMen": widget.forMen,
                                          "code": widget.code,
                                          "isFavoriteModel":
                                              widget.isFavoriteModel,
                                          "models": true
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
