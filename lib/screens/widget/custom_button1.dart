
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

class CustomButton1 extends StatelessWidget {
  const CustomButton1({super.key, required this.onTap, required this.text, this.width, this.fSize});

  final VoidCallback onTap;
  final String text;
  final double? width;
  final double? fSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: ElevatedButton(onPressed: () {
        onTap.call();
      },style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppColors.s6176f6),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
          ))
      ), child: Text(text, style: TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.bold,
          fontSize: fSize
      ),)),
    );
  }
}
