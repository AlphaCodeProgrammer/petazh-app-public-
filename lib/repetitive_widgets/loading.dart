import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../providers/store.dart';
import 'package:flutter/material.dart';

class LOADING extends StatefulWidget {
  @override
  State<LOADING> createState() => _LOADINGState();
}

class _LOADINGState extends State<LOADING> {
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Barbers>(context, listen: false).getProfile(context, true);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: SizedBox(
            width: mediaQueryWidth > 200 ? 300 : mediaQueryWidth / 1.3,
            child: Center(child: Image.asset('assets/images/petazh-logo.png')),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SpinKitThreeBounce(
          size: 20,
          color: Colors.grey,
        )
      ],
    ));
  }
}
