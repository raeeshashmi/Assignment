import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final bool withImage;
  final String hintText;
  final String imageUrl;
  final TextEditingController controller;
  const CustomTextfield({
    super.key,
    required this.hintText,
    required this.imageUrl,
    required this.controller,
    required this.withImage,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: Color(0xffE8E8E8),
          ),
        ),
        child: Row(
          children: [
            SizedBox(width: 10),
            withImage ? Image.asset(imageUrl) : SizedBox.shrink(),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: controller,
                cursorColor: Color(0xff9E9E9E),
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: Color(0xff9E9E9E),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
