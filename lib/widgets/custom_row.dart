import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final bool value;
  final String text;
  final void Function(bool?) onChnaged;
  const CustomRow({
    super.key,
    required this.value,
    required this.onChnaged,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: Color(0xff0139FF),
          side: BorderSide(
            color: Color(0xffE8E8E8),
          ),
          value: value,
          onChanged: onChnaged,
        ),
        SizedBox(width: 5),
        Text(
          'Include nearby $text ports',
          style: TextStyle(
            color: Color(0xff666666),
          ),
        )
      ],
    );
  }
}
