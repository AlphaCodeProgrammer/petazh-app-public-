import 'package:flutter/material.dart';

class CHAGNE_GUID extends StatelessWidget {
  final String navbarName;
  final Function routeHandler;
  final IconData relativeIcon;
  final String info;

  @override
  CHAGNE_GUID(this.navbarName, this.routeHandler, this.relativeIcon, this.info);
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: InkWell(
        onTap: () => routeHandler(),
        child: Card(
          elevation: 5,
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Icon(relativeIcon),
                    flex: 1,
                  ),
                 
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment:CrossAxisAlignment.center,
                    
                      children: [
                        Text(
                          navbarName,
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                    flex: 6,
                  ),
                   Expanded(
                    child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment:CrossAxisAlignment.center,
                      children: [
                        Text(
                          info,
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ],
                    ),
                    flex: 6,
                  ),
                  Expanded(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 15,
                    ),
                    flex: 1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
