import 'package:flutter/material.dart';

class CustomDarkText extends StatelessWidget {
  final String text;
  const CustomDarkText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 17.5),
      child: Text(
        '${text}ft',
        style: TextStyle(
          color: Color(0xff212121),
        ),
      ),
    );
  }
}
