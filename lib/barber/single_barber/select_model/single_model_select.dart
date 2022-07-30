import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/store.dart';

class SINGLE_MODEL extends StatefulWidget {
  final String id;
  final String sideImage;
  final String name;
  final String type;
  final String code;
  final bool forMen;

  @override
  SINGLE_MODEL(
      this.id, this.sideImage, this.name, this.type, this.code, this.forMen);

  @override
  State<SINGLE_MODEL> createState() => _SINGLE_MODELState();
}

class _SINGLE_MODELState extends State<SINGLE_MODEL> {
  bool selectedModel = false;
  @override
  Widget build(BuildContext context) {
    final barberData = Provider.of<Barbers>(context, listen: true);

    return Center(
      child: SizedBox(
        width: 400,
        child: Container(
          margin: EdgeInsets.all(20),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: InkWell(
                  hoverColor: Colors.white,
                  highlightColor: Colors.white,
                  splashColor: Colors.white,
                  onTap: () {
                    barberData.addModel(widget.id);

                    selectedModel = true;
                  },
                  onLongPress: () {
                    barberData.removeModel(widget.id);
                    selectedModel = false;
                  },
                  child: Image.network(
                    widget.sideImage,
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
                              widget.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: selectedModel == true
                                    ? Colors.green
                                    : Colors.blue,
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
                                color: selectedModel == true
                                    ? Colors.green
                                    : Colors.blue,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
