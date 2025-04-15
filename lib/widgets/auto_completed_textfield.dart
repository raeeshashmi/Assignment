import 'package:flutter/material.dart';

class AutoCompleteTextField extends StatelessWidget {
  final bool withImage;
  final String hintText;
  final String imageUrl;
  final TextEditingController controller;
  final List<String> suggestions;
  final void Function(String)? onSelected;
  final Widget? suffixIcon;
  final Color borderColor;
  final Color cursorColor;
  final Color hintColor;
  final double borderRadius;

  const AutoCompleteTextField({
    super.key,
    required this.hintText,
    required this.imageUrl,
    required this.controller,
    required this.suggestions,
    this.onSelected,
    this.withImage = false,
    this.suffixIcon,
    this.borderColor = const Color(0xffE8E8E8),
    this.cursorColor = const Color(0xff9E9E9E),
    this.hintColor = const Color(0xff9E9E9E),
    this.borderRadius = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Autocomplete<String>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text.isEmpty) {
            return const Iterable<String>.empty();
          }
          return suggestions.where((String option) {
            return option
                .toLowerCase()
                .contains(textEditingValue.text.toLowerCase());
          });
        },
        onSelected: onSelected,
        fieldViewBuilder: (BuildContext context,
            TextEditingController fieldController,
            FocusNode focusNode,
            VoidCallback onFieldSubmitted) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(color: borderColor),
            ),
            child: Row(
              children: [
                const SizedBox(width: 10),
                if (withImage) Image.asset(imageUrl, width: 24, height: 24),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: fieldController,
                    focusNode: focusNode,
                    cursorColor: cursorColor,
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: TextStyle(color: hintColor),
                      border: InputBorder.none,
                      suffixIcon: suffixIcon,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        optionsViewBuilder: (BuildContext context,
            AutocompleteOnSelected<String> onSelected,
            Iterable<String> options) {
          return Align(
            alignment: Alignment.topLeft,
            child: Material(
              elevation: 4.0,
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: options.length,
                  itemBuilder: (BuildContext context, int index) {
                    final String option = options.elementAt(index);
                    return InkWell(
                      onTap: () {
                        onSelected(option);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(option),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
