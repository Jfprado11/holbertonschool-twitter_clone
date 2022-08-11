import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  const CustomFlatButton({
    Key? key,
    required this.label,
    required this.onPressed(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      width: 150.0,
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 30.0,
              fontFamily: 'Raleway',
              height: 1.0,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
