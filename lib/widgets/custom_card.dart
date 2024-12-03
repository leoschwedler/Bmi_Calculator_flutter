import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 18, color: Colors.white),
        )
      ],
    );
  }
}
