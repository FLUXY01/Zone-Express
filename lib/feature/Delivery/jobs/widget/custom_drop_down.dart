import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> options; // options list
  final String hintText; // customizable hint inside dropdown

  const CustomDropdown({
    Key? key,
    required this.options,
    this.hintText = "Select", // default
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          colors: [Color(0xFFFFFFFF), Color(0xFFF5F2E7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          isExpanded: true, // 👈 expands text inside
          hint: Text(
            widget.hintText,
            maxLines: 1,
            overflow: TextOverflow.ellipsis, // 👈 trim if too long
          ),
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
          items: widget.options.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis, // 👈 avoid breaking UI
              ),
            );
          }).toList(),
          onChanged: widget.options.isEmpty
              ? null
              : (String? newValue) {
                  setState(() {
                    selectedValue = newValue;
                  });
                },
        ),
      ),
    );
  }
}
