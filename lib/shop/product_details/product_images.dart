import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import '../../providers/store.dart';

class PRODUCT_IMAGES extends StatefulWidget {
  @override
  State<PRODUCT_IMAGES> createState() => _PRODUCT_IMAGESState();
}

class _PRODUCT_IMAGESState extends State<PRODUCT_IMAGES> {
  String mainImage = "";

  bool _isInit = true;
  void didChangeDependencies() {
    if (_isInit) {
      mainImage = Provider.of<Barbers>(context).productDetails["images"][0];
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void changeMainImage(String nextImage) {
    setState(() {
      mainImage = nextImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final storeFunc = Provider.of<Barbers>(context);

    return Card(
      elevation: 5,
      child: Container(
          margin: EdgeInsets.all(15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: Image.network(
                mainImage,
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width / 3,
                height: 400,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              height: 100,
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                  },
                ),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: storeFunc.productDetails["images"].length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          changeMainImage(
                              storeFunc.productDetails["images"][index]);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Color.fromARGB(255, 206, 201, 201),
                          )),
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(5),
                          child: Image.network(
                              storeFunc.productDetails["images"][index],
                              fit: BoxFit.cover,
                              width: 50),
                        ),
                      );
                    }),
              ),
            ),
          ])),
    );
  }
}
