import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key, required this.color, this.custom_card, this.onTap});

  final Color color;
  final Widget? custom_card;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        margin: EdgeInsets.all(15),
        child: custom_card,
      ),
    );
  }
}
