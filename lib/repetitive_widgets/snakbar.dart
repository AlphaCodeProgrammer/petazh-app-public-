import 'package:flutter/material.dart';

class SNACKBAR extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SnackBar(
            content: const Text('Yay! A SnackBar!'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          ),
    );
  }
}