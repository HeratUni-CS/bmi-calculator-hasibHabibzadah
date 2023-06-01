import 'package:flutter/material.dart';
import '../constant.dart';

class BottomButton extends StatelessWidget {
  Function() onPressed;
  String label;

  BottomButton({@required this.onPressed, @required this.label});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 80,
        color: kButtonContainerColor,
        margin: EdgeInsets.only(top: 10),
        child: Center(
          child: Text(
            label,
            style: kLargeButtonStyle,
          ),
        ),
      ),
    );
  }
}
