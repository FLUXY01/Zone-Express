import 'dart:io';
import 'package:flutter/material.dart';
import 'custom_textfield_drop_off.dart';

class LabeledInputRow extends StatelessWidget {
  final String label;
  final TextEditingController? textController;
  final File? imageFile;
  final VoidCallback? onPickImage;
  final String hintText;
  final bool isObscure;
  final String? errorText; // optional error message

  const LabeledInputRow({
    Key? key,
    required this.label,
    this.textController,
    this.imageFile,
    this.onPickImage,
    this.hintText = "Enter",
    this.isObscure = false,
    this.errorText,
  }) : assert(
         !(textController != null && imageFile != null),
         "Provide either textController or imageFile, not both.",
       ),
       super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontFamily: "WorkSans",
              ),
            ),
            const Spacer(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: screenHeight * 0.05,
                  child: textController != null
                      ? CustomTextFieldDropOff(
                          hintText: hintText,
                          controller: textController!,
                          isObscure: isObscure,
                        )
                      : InkWell(
                          onTap: onPickImage,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: imageFile != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(
                                      imageFile!,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                  )
                                : Text(
                                    hintText,
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
        if (errorText != null && errorText!.isNotEmpty) ...[
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              errorText!,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
        ],
      ],
    );
  }
}
