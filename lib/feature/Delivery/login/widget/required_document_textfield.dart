import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequiredDocumentTextfield extends StatelessWidget {
  final String hintText;
  final Rx<File?> imageFile;
  final VoidCallback onPickImage;
  final VoidCallback onClearImage;

  const RequiredDocumentTextfield({
    super.key,
    required this.hintText,
    required this.imageFile,
    required this.onPickImage,
    required this.onClearImage,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: onPickImage,
              child: imageFile.value == null
                  ? const Icon(Icons.add_a_photo, color: Colors.grey)
                  : Stack(
                      alignment: Alignment.topRight,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            imageFile.value!,
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                        GestureDetector(
                          onTap: onClearImage,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.black54,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(2),
                            child: const Icon(
                              Icons.close,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(hintText, style: const TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }
}
