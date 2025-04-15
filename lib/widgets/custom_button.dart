import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final bool haveIcon;
  final String buttonText;
  final void Function() onTap;
  const CustomButton({
    super.key,
    required this.onTap,
    required this.buttonText,
    required this.haveIcon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onTap,
      child: Container(
        width: 104,
        height: 35,
        decoration: BoxDecoration(
          color: Color(0xffE6EBFF),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: Color(0xff0139FF),
          ),
        ),
        child: haveIcon
            ? Row(
                children: [
                  SizedBox(width: 10),
                  Icon(
                    CupertinoIcons.search,
                    color: Color(0xff0139FF),
                  ),
                  Text(
                    buttonText,
                    style: TextStyle(
                      color: Color(0xff0139FF),
                    ),
                  ),
                ],
              )
            : Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: Color(0xff0139FF),
                  ),
                ),
              ),
      ),
    );
  }
}
