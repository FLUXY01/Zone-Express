import 'package:flutter/material.dart';
import 'package:zone_express/common/comm_button_yellow.dart';

import '../../../../utils/constants/font.dart';

enum AccountFieldType { name, email, gender, dob, emergencyContact }

void showAccountFieldBottomSheet(BuildContext context, AccountFieldType type) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;
  showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    isScrollControlled: true,
    builder: (context) {
      String title = "";
      Widget content = const SizedBox();

      switch (type) {
        case AccountFieldType.name:
          title = "Enter Your Name";
          content = const _NameEmailInput(hint: "Name");
          break;

        case AccountFieldType.email:
          title = "Enter Your Email";
          content = const _NameEmailInput(hint: "Email");
          break;

        case AccountFieldType.gender:
          title = "Enter Your Gender";
          content = const _GenderSelector();
          break;

        case AccountFieldType.dob:
          title = "Enter Your Date of Birth";
          content = const _DobPicker();
          break;

        case AccountFieldType.emergencyContact:
          title = "Enter Emergency Contact";
          content = const _NameEmailInput(hint: "Contact Number");
          break;
      }

      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.35, // 🔹 default height
        minChildSize: 0.25,
        maxChildSize: 0.65, // 🔹 can drag bigger
        builder: (context, scrollController) {
          return Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Drag handle
                  Center(
                    child: Container(
                      width: 40,
                      height: 5,
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  // Title
                  Center(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: Tfonts.workSansFont,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Dynamic Content
                  content,
                  const SizedBox(height: 30),
                  // Save Button at Center
                  Center(
                    child: SizedBox(
                      width: 160,
                      child: CommonButtonYellow(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        label: 'Save',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

// 📌 Reusable TextField for Name & Email
class _NameEmailInput extends StatelessWidget {
  final String hint;
  const _NameEmailInput({required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

// 📌 Gender Selector
class _GenderSelector extends StatefulWidget {
  const _GenderSelector();

  @override
  State<_GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<_GenderSelector> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile<String>(
          title: const Text("Male"),
          value: "Male",
          groupValue: selectedGender,
          onChanged: (value) => setState(() => selectedGender = value),
        ),
        RadioListTile<String>(
          title: const Text("Female"),
          value: "Female",
          groupValue: selectedGender,
          onChanged: (value) => setState(() => selectedGender = value),
        ),
        RadioListTile<String>(
          title: const Text("Prefer not to say"),
          value: "Prefer not to say",
          groupValue: selectedGender,
          onChanged: (value) => setState(() => selectedGender = value),
        ),
      ],
    );
  }
}

// 📌 Date of Birth Picker
class _DobPicker extends StatefulWidget {
  const _DobPicker();

  @override
  State<_DobPicker> createState() => _DobPickerState();
}

class _DobPickerState extends State<_DobPicker> {
  DateTime? selectedDate;

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          selectedDate == null
              ? "No date selected,"
              : "Selected: ${selectedDate!.toLocal().toString().split(' ')[0]}",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: Tfonts.workSansFont,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.yellow[700], // 🔹 button color
            foregroundColor: Colors.white, // 🔹 text color
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // 🔹 rounded corners
            ),
            elevation: 3, // 🔹 subtle shadow
          ),
          onPressed: () => _pickDate(context),
          child: const Text(
            "Select Date",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: Tfonts.workSansFont,
            ),
          ),
        ),
      ],
    );
  }
}
