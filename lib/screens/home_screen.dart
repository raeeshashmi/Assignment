import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:assignment/utils/helper_functions.dart';
import 'package:assignment/widgets/auto_completed_textfield.dart';
import 'package:assignment/widgets/custom_button.dart';
import 'package:assignment/widgets/custom_dark_text.dart';
import 'package:assignment/widgets/custom_date_picker.dart';
import 'package:assignment/widgets/custom_labled_dropdown.dart';
import 'package:assignment/widgets/custom_light_text.dart';
import 'package:assignment/widgets/custom_row.dart';
import 'package:assignment/widgets/custom_row2.dart';
import 'package:assignment/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  final TextEditingController _originController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _boxesController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  List<String> _universityNames = [];

  Future<void> fetchUniversityNames() async {
    try {
      final response = await http.get(
        Uri.parse("http://universities.hipolabs.com/search?name=middle"),
      );
      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        setState(() {
          _universityNames =
              data.map<String>((item) => item['name'] as String).toList();
        });
      } else {
        throw Exception('Failed to load universities');
      }
    } catch (e) {
      debugPrint("Error fetching universities: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUniversityNames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 25, bottom: 75),
        child: CustomButton(
          haveIcon: true,
          onTap: () {},
          buttonText: 'Search',
        ),
      ),
      backgroundColor: Color(0xffe6eaf8),
      appBar: HelperFunctions.customAppBar(),
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 50),
        padding: EdgeInsets.only(left: 15, right: 15, top: 25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AutoCompleteTextField(
                  hintText: 'Origin',
                  imageUrl: 'assets/images/location.png',
                  controller: _originController,
                  suggestions: _universityNames,
                  withImage: true,
                  onSelected: (String selection) {
                    _originController.text = selection;
                  },
                ),
                const SizedBox(height: 20),
                AutoCompleteTextField(
                  hintText: 'Destination',
                  imageUrl: 'assets/images/location.png',
                  controller: _destinationController,
                  suggestions: _universityNames,
                  withImage: true,
                  onSelected: (String selection) {
                    _destinationController.text = selection;
                  },
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  child: CustomRow(
                    value: value1,
                    onChnaged: (val) => setState(() => value1 = val!),
                    text: 'origin',
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: CustomRow(
                    value: value2,
                    onChnaged: (val) => setState(() => value2 = val!),
                    text: 'destination',
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: CustomLabledDropdown(
                    labelText: 'Commodity',
                    items: ['Rice', 'Wheat', 'Sugar', 'Oil', 'Salt'],
                  ),
                ),
                SizedBox(width: 25),
                CustomDatePicker(),
              ],
            ),
            SizedBox(height: 25),
            Text(
              'Shipment Type :',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25),
            Row(
              children: [
                CustomRow2(
                  value: value3,
                  onChnaged: (val) => setState(() => value3 = val!),
                  text: 'F',
                ),
                SizedBox(width: 30),
                CustomRow2(
                  value: value4,
                  onChnaged: (val) => setState(() => value4 = val!),
                  text: 'L',
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                SizedBox(
                  width: 750,
                  child: CustomLabledDropdown(
                    labelText: "Container Size",
                    items: [
                      '10’ Standard',
                      '20’ Standard',
                      '30’ Standard',
                      '40’ Standard',
                      '50’ Standard',
                    ],
                  ),
                ),
                SizedBox(width: 25),
                CustomTextfield(
                  withImage: false,
                  hintText: 'No of Boxes',
                  imageUrl: '',
                  controller: _boxesController,
                ),
                SizedBox(width: 25),
                CustomTextfield(
                  withImage: false,
                  hintText: 'Weight (Kg)',
                  imageUrl: '',
                  controller: _weightController,
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.info_outline),
                ),
                Text(
                  'To obtain accurate rate for spot rate with guaranteed space and booking, please ensure your container count and weight per container is accurate.',
                  style: TextStyle(
                    fontSize: 15.50,
                    color: Color(0xff666666),
                  ),
                )
              ],
            ),
            SizedBox(height: 25),
            Text(
              'Container Internal Dimensions :',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomLightText(text: 'Length'),
                    CustomLightText(text: 'Width'),
                    CustomLightText(text: 'Height'),
                  ],
                ),
                SizedBox(width: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDarkText(text: '39.46'),
                    CustomDarkText(text: '7.70'),
                    CustomDarkText(text: '7.84'),
                  ],
                ),
                SizedBox(width: 25),
                Image.asset(
                  'assets/images/container.png',
                  width: 256,
                  height: 96,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
