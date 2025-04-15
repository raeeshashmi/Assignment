import 'package:flutter/material.dart';

class CustomLabledDropdown extends StatefulWidget {
  final List<String> items;
  final String labelText;
  const CustomLabledDropdown({
    super.key,
    required this.items,
    required this.labelText,
  });

  @override
  CustomLabledDropdownState createState() => CustomLabledDropdownState();
}

class CustomLabledDropdownState extends State<CustomLabledDropdown> {
  String? selectedCommodity;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      icon: Image.asset('assets/images/arrow.png'),
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: Color(0xff9E9E9E),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffE8E8E8),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffE8E8E8),
          ),
        ),
      ),
      value: selectedCommodity,
      onChanged: (value) {
        setState(() {
          selectedCommodity = value;
        });
      },
      items: widget.items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
    );
  }
}
