import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/app_colors.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
  bool? enableTitleText;
  String? titleText;
  Color? titleTextColor;
  Color? textFieldColor;
  double? textFieldHeight;
  String? hintText;
  Color? hintColor;
  int? maxLength;
  bool enableCounterText;
  AutovalidateMode? autovalidateMode;
  bool? readOnly;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  FormFieldValidator<String?>? validator;
  ValueChanged<String>? onChanged;
  GestureTapCallback? onTap;
  VoidCallback? onEditingComplete;
  ValueChanged<String>? onFieldSubmitted;
  FormFieldSetter<String?>? onSaved;
  bool? obscureText;
  String? obscuringCharacter;
  TextAlign? textAlign;
  TextAlignVertical? textAlignVertical;
  InputDecoration? decoration;
  EdgeInsets? contentPadding;
  TextStyle? hintTextStyle;
  double? textFieldWidth;
  Color? cursorColor;
  bool? enableSuffixIcon;
  Widget? suffixIcon;
  VoidCallback? suffixIconOnTap;
  double? borderWidth;
  double? borderRadius;
  TextEditingController? controller = TextEditingController(text: '');
  bool? isPhoneField;
  Widget? phoneFieldChild;
  bool isSuffixButton;
  VoidCallback? suffixButtonOnTap;
  double? suffixButtonHeight;
  double? suffixButtonWeight;
  Widget? suffixButtonIcon;
  EdgeInsets? suffixButtonPadding;
  FocusNode? focusNode;
  String? errorText;
  BoxConstraints? prefixIconConstraints;
  Widget? prefixIcon;
  VoidCallback? prefixIconOnTap;
  int? maxLines;
  int? minLines;

  bool? isDense;
  TextStyle? inputTextStyle;
  TextStyle? titleTextStyle;
  bool? isEnable;
  Iterable<String>? autofillHints;

  TextFieldWidget({
    Key? key,
    this.hintText,
    this.enableTitleText = false,
    this.titleText,
    this.titleTextColor,
    this.hintColor,
    this.controller,
    this.textFieldColor,
    this.textFieldHeight,
    this.maxLength,
    this.autovalidateMode,
    this.readOnly,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.onTap,
    this.onSaved,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.obscureText = false,
    this.obscuringCharacter,
    this.textAlign,
    this.textAlignVertical,
    this.decoration,
    this.contentPadding,
    this.hintTextStyle,
    this.enableSuffixIcon = false,
    this.suffixIcon,
    this.cursorColor,
    this.borderRadius,
    this.borderWidth,
    this.textFieldWidth,
    this.isPhoneField = false,
    this.phoneFieldChild,
    this.isSuffixButton = false,
    this.suffixButtonOnTap,
    this.suffixButtonIcon,
    this.suffixButtonHeight,
    this.suffixButtonWeight,
    this.suffixButtonPadding,
    this.focusNode,
    this.errorText,
    this.prefixIconConstraints,
    this.prefixIcon,
    this.maxLines,
    this.prefixIconOnTap,
    this.suffixIconOnTap,
    this.isDense = false,
    this.inputTextStyle,
    this.enableCounterText = false,
    this.titleTextStyle,
    this.minLines,
    this.isEnable,
    this.autofillHints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: textFieldHeight,
          width: textFieldWidth ?? double.maxFinite,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isPhoneField == true)
                Container(
                  padding: contentPadding ??
                      const EdgeInsets.fromLTRB(10, 9.5, 8, 9.5),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    border:
                        Border.all(width: 1, color: AppColors.lightGrayColor),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(borderRadius ?? 12),
                      topLeft: Radius.circular(borderRadius ?? 12),
                    ),
                  ),
                  child: phoneFieldChild,
                ),
              Expanded(
                child: SizedBox(
                  child: TextFormField(
                    enabled: isEnable,
                    controller: controller,
                    focusNode: focusNode,
                    autofillHints: autofillHints,
                    autovalidateMode:
                        autovalidateMode ?? AutovalidateMode.onUserInteraction,
                    readOnly: readOnly ?? false,
                    keyboardType: keyboardType,
                    textInputAction: textInputAction,
                    cursorColor: cursorColor ?? AppColors.primaryColor,
                    validator: validator,
                    onChanged: onChanged,
                    onEditingComplete: onEditingComplete,
                    onFieldSubmitted: onFieldSubmitted,
                    onSaved: onSaved,
                    onTap: onTap,
                    maxLines: maxLines ?? 1,
                    minLines: minLines,
                    obscureText: obscureText ?? false,
                    obscuringCharacter: obscuringCharacter ?? '•',
                    textAlignVertical:
                        textAlignVertical ?? TextAlignVertical.center,
                    textAlign: textAlign ?? TextAlign.start,
                    maxLength: maxLength,
                    style: inputTextStyle ??
                        TextStyle(
                          color: isEnable == true
                              ? AppColors.hintGrayColor
                              : AppColors.textColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 8.sp,
                        ),
                    decoration: decoration ??
                        InputDecoration(
                          isDense: isDense,
                          counterText: enableCounterText ? null : '',
                          suffixIconConstraints: suffixIcon != null
                              ? const BoxConstraints()
                              : null,
                          suffixIcon: enableSuffixIcon!
                              ? IgnorePointer(
                                  ignoring:
                                      suffixIconOnTap == null ? true : false,
                                  child: InkWell(
                                    onTap: suffixIconOnTap,
                                    child: suffixIcon ??
                                        (!obscureText!
                                            ? Icon(
                                                Icons.visibility,
                                                color:
                                                    AppColors.primaryLightColor,
                                              )
                                            : Icon(
                                                Icons.visibility_off,
                                                color: AppColors.dotGrayColor,
                                              )),
                                  ),
                                )
                              : null,
                          fillColor: textFieldColor ?? AppColors.whiteColor,
                          filled: true,
                          prefixIconConstraints: prefixIconConstraints,
                          prefixIcon: prefixIcon,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: borderWidth ?? 1,
                                color: AppColors.lightGrayColor),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(borderRadius ?? 12),
                              topRight: Radius.circular(borderRadius ?? 12),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: borderWidth ?? 1,
                                color: AppColors.lightGrayColor),
                            borderRadius: isPhoneField == true
                                ? BorderRadius.only(
                                    bottomRight:
                                        Radius.circular(borderRadius ?? 12),
                                    topRight:
                                        Radius.circular(borderRadius ?? 12),
                                  )
                                : isSuffixButton
                                    ? BorderRadius.only(
                                        bottomLeft:
                                            Radius.circular(borderRadius ?? 12),
                                        topLeft:
                                            Radius.circular(borderRadius ?? 12),
                                      )
                                    : BorderRadius.circular(borderRadius ?? 12),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: borderWidth ?? 1,
                                color: AppColors.lightGrayColor),
                            borderRadius: isPhoneField == true
                                ? BorderRadius.only(
                                    bottomRight:
                                        Radius.circular(borderRadius ?? 12),
                                    topRight:
                                        Radius.circular(borderRadius ?? 12),
                                  )
                                : isSuffixButton
                                    ? BorderRadius.only(
                                        bottomLeft:
                                            Radius.circular(borderRadius ?? 12),
                                        topLeft:
                                            Radius.circular(borderRadius ?? 12),
                                      )
                                    : BorderRadius.circular(borderRadius ?? 12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: borderWidth ?? 1,
                                color: AppColors.lightGrayColor),
                            borderRadius: isPhoneField == true
                                ? BorderRadius.only(
                                    bottomRight:
                                        Radius.circular(borderRadius ?? 12),
                                    topRight:
                                        Radius.circular(borderRadius ?? 12),
                                  )
                                : isSuffixButton
                                    ? BorderRadius.only(
                                        bottomLeft:
                                            Radius.circular(borderRadius ?? 12),
                                        topLeft:
                                            Radius.circular(borderRadius ?? 12),
                                      )
                                    : BorderRadius.circular(borderRadius ?? 12),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: borderWidth ?? 1,
                                color: AppColors.redColor),
                            borderRadius: isPhoneField == true
                                ? BorderRadius.only(
                                    bottomRight:
                                        Radius.circular(borderRadius ?? 12),
                                    topRight:
                                        Radius.circular(borderRadius ?? 12),
                                  )
                                : isSuffixButton
                                    ? BorderRadius.only(
                                        bottomLeft:
                                            Radius.circular(borderRadius ?? 12),
                                        topLeft:
                                            Radius.circular(borderRadius ?? 12),
                                      )
                                    : BorderRadius.circular(borderRadius ?? 12),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: borderWidth ?? 1,
                                color: AppColors.redColor),
                            borderRadius: isPhoneField == true
                                ? BorderRadius.only(
                                    bottomRight:
                                        Radius.circular(borderRadius ?? 12),
                                    topRight:
                                        Radius.circular(borderRadius ?? 12),
                                  )
                                : isSuffixButton
                                    ? BorderRadius.only(
                                        bottomLeft:
                                            Radius.circular(borderRadius ?? 12),
                                        topLeft:
                                            Radius.circular(borderRadius ?? 12),
                                      )
                                    : BorderRadius.circular(borderRadius ?? 12),
                          ),
                          errorStyle: TextStyle(
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.clip,
                          ),
                          errorMaxLines: 5,
                          errorText: errorText,
                          hintText: hintText ?? '',
                          hintStyle: hintTextStyle ??
                              TextStyle(
                                color: hintColor ?? AppColors.hintGrayColor,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                              ),
                          contentPadding: contentPadding ??
                              EdgeInsets.fromLTRB(3.w, 2.w, 5.w, 2.w),
                        ),
                  ),
                ),
              ),
              if (isSuffixButton)
                SizedBox(
                  height: suffixButtonHeight ??
                      (100.h > 1000
                          ? 4.5.h
                          : 100.h > 800
                              ? 6.h
                              : 100.h > 700
                                  ? 4.6.h
                                  : 5.h),
                  width: suffixButtonWeight ?? 10.w,
                  child: ElevatedButton(
                    onPressed: suffixButtonOnTap,
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: suffixButtonPadding ?? EdgeInsets.zero,
                      backgroundColor: AppColors.primaryLightColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        side: BorderSide(style: BorderStyle.none),
                      ),
                    ),
                    child: suffixButtonIcon ??
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: AppColors.whiteColor,
                          size: 5.w,
                        ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
