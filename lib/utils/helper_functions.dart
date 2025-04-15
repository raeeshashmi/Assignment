import 'package:assignment/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class HelperFunctions {
  static AppBar customAppBar() {
    return AppBar(
      backgroundColor: Color(0xfff3f5fc),
      title: Text('Search the best Freight Rates'),
      actions: [
        CustomButton(haveIcon: false, onTap: () {}, buttonText: 'History'),
        SizedBox(width: 25),
      ],
    );
  }
}
