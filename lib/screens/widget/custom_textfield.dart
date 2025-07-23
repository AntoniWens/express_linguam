
import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key, required this.hint, required this.image, this.controller});

  final String hint;
  final String image;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.s194274)
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.s194274)
        ),
        hintText: hint,
        hintStyle: TextStyle(
            fontWeight: FontWeight.w500
        ),
        contentPadding: EdgeInsets.zero,
        prefixIcon: Padding(
          padding: EdgeInsets.all(6),
          child: SizedBox(
            width: 20,
            height: 20,
            child: Image.asset(image),
          ),
        ),
      ),
    );
  }
}
