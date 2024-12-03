import 'package:flutter/material.dart';

class CustomFloat extends StatelessWidget {
  const CustomFloat({super.key, required this.widget, required this.onPressed});

  final Widget widget;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(height: 56, width: 56),
      elevation: 5,
      child: widget,
      fillColor: Colors.grey,
    );
  }
}
