import 'package:flutter/material.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({super.key});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? selectedDate;
  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50,
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: Color(0xffE8E8E8),
          ),
        ),
        child: Row(
          children: [
            selectedDate == null
                ? Text(
                    'Cut Off Date',
                    style: TextStyle(
                      color: Color(0xff9E9E9E),
                    ),
                  )
                : Text(
                    '${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}',
                  ),
            Spacer(),
            IconButton(
              onPressed: _pickDate,
              icon: Image.asset('assets/images/calendar.png'),
            ),
          ],
        ),
      ),
    );
  }
}
