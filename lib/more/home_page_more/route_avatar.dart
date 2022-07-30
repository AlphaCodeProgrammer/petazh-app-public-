import 'package:flutter/material.dart';

class ROUTE_AVATAR extends StatelessWidget {
  final String iconImage;
  final String iconName;
  final Function pushToRouteFucntion;
  ROUTE_AVATAR(this.iconImage, this.iconName, this.pushToRouteFucntion);

 

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>pushToRouteFucntion()
      ,
      splashColor: Theme.of(context).primaryColor,
      hoverColor: Theme.of(context).primaryColor,
      highlightColor: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Tab(
            icon: Image.asset(iconImage),
            height: 50,
          ),
          SizedBox(
            height: 5,
          ),
          Container(
              child: Text(
            iconName,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          )),
        ],
      ),
    );
  }
}
