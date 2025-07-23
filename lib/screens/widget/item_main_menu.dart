import 'package:flutter/material.dart';

class ItemMainMenu extends StatelessWidget {
  final String title;
  final String? lockText;
  final String icon;
  final String backgroundAsset;
  final VoidCallback? onTap;

  const ItemMainMenu({
    Key? key,
    required this.title,
    this.lockText = '',
    required this.icon,
    required this.backgroundAsset,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: EdgeInsets.symmetric(horizontal: 2),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          splashColor: Colors.white24,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background image
              Image.asset(
                backgroundAsset,
                fit: BoxFit.cover,
              ),


              // Icon Top Left
              Positioned(
                top: 8,
                left: 8,
                child: Image.asset(
                  icon,
                  width: 32,
                  height: 32,
                ),
              ),

              // Title Bottom Center
              Positioned(
                bottom: 4,
                left: 8,
                right: 8,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              if (lockText != null && lockText!.isNotEmpty)
                Center(
                  child: Text(
                    lockText!,
                    style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF004DE8),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
