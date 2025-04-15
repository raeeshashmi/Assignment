import 'package:flutter/material.dart';

class CustomLightText extends StatelessWidget {
  final String text;
  const CustomLightText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 17.5),
      child: Text(
        text,
        style: TextStyle(
          color: Color(0xff666666),
        ),
      ),
    );
  }
}
