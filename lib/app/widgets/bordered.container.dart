import 'package:flutter/material.dart';
import 'package:hubtel_coding_challenge_repo/utils/constants/dimens.dart';
import 'package:hubtel_coding_challenge_repo/utils/constants/theme.colors.dart';

class BorderedContainer extends StatelessWidget {
  const BorderedContainer({
    super.key,
    required this.child,
    this.borderRadius,
    this.borderRadiusValue,
    this.borderColor,
    this.borderWidth,
    this.containerPadding,
    this.containerMargin,
    this.onTap,
    this.containerColor,
    this.containerWidth,
    this.containerheight,
    this.alignment,
  });

  final Widget child;
  final BorderRadiusGeometry? borderRadius;
  final double? borderRadiusValue;
  final double? containerWidth;
  final double? containerheight;
  final Color? borderColor;
  final Color? containerColor;
  final double? borderWidth;
  final EdgeInsetsGeometry? containerPadding;
  final EdgeInsetsGeometry? containerMargin;
  final Function()? onTap;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 900),
        padding: containerPadding ?? const EdgeInsets.all(tenDp),
        margin: containerMargin ?? const EdgeInsets.all(fiveDp),
        alignment: alignment ?? Alignment.center,
        width: containerWidth,
        height: containerheight,
        decoration: BoxDecoration(
          color: containerColor,
          border: Border.all(
            color: borderColor ?? ThemeColor.kGreyLight,
            width: borderWidth ?? 1.0,
          ),
          borderRadius: borderRadius ?? BorderRadius.circular(borderRadiusValue ?? tenDp),
        ),
        child: child,
      ),
    );
  }
}
