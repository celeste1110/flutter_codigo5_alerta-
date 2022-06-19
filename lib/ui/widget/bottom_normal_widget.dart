import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtomNormalWidget extends StatelessWidget {
  String title;
  Function onPressed;

  ButtomNormalWidget({
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          primary: Color(0xff5468FF),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18)),
        ),
        child: Text(
          title,
        ),
      ),
    );
  }
}
