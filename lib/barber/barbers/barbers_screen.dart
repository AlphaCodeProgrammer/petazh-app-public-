import 'package:flutter/material.dart';
import './barbers_grid.dart';
import './appbar_barber_screen.dart';

class BARBERS_SCREEN extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: APPBAR_BARBER_SCREEN(),
        elevation: 1,
        automaticallyImplyLeading: false,
      ),
      body: Container(child: BARBERS_GRID()),
    );
  }
}
