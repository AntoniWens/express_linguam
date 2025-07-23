import 'package:flutter/cupertino.dart';

import '../../core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, required this.image, required this.text});

  final VoidCallback onTap;
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
            color: AppColors.white
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(image, width: 20, height: 20,),
            SizedBox(width: 8,),
            Text(text)
          ],
        ),
      ),
    );
  }
}
