import 'package:flutter/services.dart';

class CountryCodeFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text;

    // Allow only digits and '+'
    newText = newText.replaceAll(RegExp(r'[^0-9+]'), '');

    // Remove existing spaces
    String digitsOnly = newText.replaceAll(' ', '');

    // Insert space after +XX (2-digit country code)
    if (digitsOnly.startsWith('+') && digitsOnly.length > 3) {
      digitsOnly = digitsOnly.substring(0, 3) + ' ' + digitsOnly.substring(3);
    }

    // Calculate new cursor position
    int cursorPosition = newValue.selection.end;

    // Count spaces in new text before cursor
    int spacesBeforeCursor =
        digitsOnly
            .substring(
              0,
              cursorPosition > digitsOnly.length
                  ? digitsOnly.length
                  : cursorPosition,
            )
            .split(' ')
            .length -
        1;

    cursorPosition += spacesBeforeCursor;

    // Ensure cursor is within bounds
    if (cursorPosition > digitsOnly.length) cursorPosition = digitsOnly.length;

    return TextEditingValue(
      text: digitsOnly,
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
  }
}
