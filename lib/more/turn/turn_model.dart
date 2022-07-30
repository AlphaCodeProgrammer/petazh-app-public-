import 'package:flutter/material.dart';

class TURN_MODEL extends StatelessWidget {
  final List<dynamic> sideImage;
  final String name;
  final String code;

  @override
  TURN_MODEL(this.sideImage, this.name, this.code);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 300,
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: InkWell(
                  child: Image.network(
                    sideImage[0],
                    fit: BoxFit.cover,
                    width: 250,
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "${name} : نام مدل  ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 12,
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
                  child: Text(
                    "${code} : کد",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 12,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
