import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/app_colors.dart';
import '../constants/app_strings.dart';

// ignore: must_be_immutable
class ButtonWidget extends StatelessWidget {
  String? buttonText;
  VoidCallback? onPressed;
  EdgeInsets? buttonMargin;
  EdgeInsets? buttonPadding;
  BorderRadius? borderRadius;
  Color? buttonColor;
  TextStyle? buttonTextStyle;
  double? buttonWidth;
  double? buttonHeight;
  ButtonStyle? elevatedButtonStyle;
  Widget? child;
  BorderSide? buttonBorderSide;
  double? buttonElevation;
  AlignmentGeometry? buttonTextAlignment;
  BoxConstraints? buttonConstraints;
  bool? isButtonEnable;

  ButtonWidget({
    Key? key,
    this.buttonText,
    required this.onPressed,
    this.buttonTextStyle,
    this.buttonMargin,
    this.buttonPadding,
    this.borderRadius,
    this.buttonColor,
    this.buttonHeight,
    this.buttonWidth,
    this.elevatedButtonStyle,
    this.child,
    this.buttonBorderSide,
    this.buttonElevation,
    this.buttonTextAlignment,
    this.buttonConstraints,
    this.isButtonEnable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: buttonMargin ?? EdgeInsets.zero,
      height: buttonConstraints != null ? null : (buttonHeight ?? 5.5.h),
      width: buttonConstraints != null
          ? null
          : (buttonWidth ?? MediaQuery.of(context).size.width),
      constraints: buttonConstraints,
      child: ElevatedButton(
        onPressed: onPressed,
        style: elevatedButtonStyle ??
            ElevatedButton.styleFrom(
              elevation: buttonElevation ?? 4,
              alignment: buttonTextAlignment,
              padding: buttonPadding ?? EdgeInsets.zero,
              backgroundColor: isButtonEnable!
                  ? (buttonColor ?? AppColors.primaryColor)
                  : AppColors.hintGrayColor,
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(10),
                side: buttonBorderSide ??
                    const BorderSide(style: BorderStyle.none),
              ),
            ),
        child: child ??
            Text(
              buttonText ?? AppStrings.next,
              style: buttonTextStyle ??
                  TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
            ),
      ),
    );
  }
}
