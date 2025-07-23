import 'package:express_lingua/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class GradientProgressIndicator extends StatelessWidget {
  final double progress;
  final Color? color;
  final Gradient? gradient;
  final double height;
  final Color? backgroundColor;
  final Gradient? backgroundGradient;
  final BorderRadiusGeometry borderRadius;

  const GradientProgressIndicator({
    super.key,
    required this.progress,
    this.color,
    this.gradient,
    this.height = 7,
    this.backgroundColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(50)),
    this.backgroundGradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        gradient:
            backgroundGradient ??
            LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.white,
                AppColors.inActiveProgress,
                AppColors.white,
              ],
              stops: [0.0, 0.5, 1.0],
            ),
        borderRadius: borderRadius,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.0, end: progress),
          duration: const Duration(milliseconds: 500),
          builder: (context, value, child) {
            return FractionallySizedBox(
              widthFactor: value,
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  gradient:
                      gradient ??
                      LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          AppColors.activeProgress,
                          AppColors.activeProgres1,
                        ],
                      ),
                  borderRadius: borderRadius,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
