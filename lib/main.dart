import 'package:flutter/material.dart';
import './Routes.dart';
import 'package:provider/provider.dart';
import './providers/store.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Flurorouter.setupRouter();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Barbers(),
          ),
        ],
        child: Consumer<Barbers>(
          builder: (ctx, auth, _) => MaterialApp(
            theme: ThemeData(
                primaryColor: Colors.white,
                canvasColor: Color.fromRGBO(255, 255, 255, 1),
                fontFamily: 'Shabnam',
                textTheme: ThemeData.light().textTheme.copyWith(
                      bodyText1:
                          TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
                      bodyText2:
                          TextStyle(color: Color.fromRGBO(128, 128, 128, 0.9)),
                    )),
            initialRoute: '/',
            onGenerateRoute: Flurorouter.router.generator,
          ),
        ));
  }
}

// now we have to initialise the router....

// thats it...all things are done now i think... :)
