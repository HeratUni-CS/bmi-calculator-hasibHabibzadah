import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData iconData;
  final void Function() onPressed;
  RoundIconButton({required this.iconData, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: const Color(0xFF1C1F32),
      shape: const CircleBorder(),
      constraints: const BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      child: Icon(iconData),
    );
  }
}
