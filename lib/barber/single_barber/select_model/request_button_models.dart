import 'package:flutter/material.dart';
import '../request_info/request_home_screen.dart';

class REQUEST_BUTTON_MODELS extends StatelessWidget {
  void ContinueTextToStylist(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      "/final-turn-request",
    );
  }

  Widget build(BuildContext context) {
    return Card(
      elevation: 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(left: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    fixedSize: const Size(80, 30),
                    padding: EdgeInsets.all(5)),
                onPressed: () => ContinueTextToStylist(context),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "ادامه",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: "Shabnam"),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 12,
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
