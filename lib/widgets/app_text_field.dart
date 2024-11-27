import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppTextField extends StatelessWidget {
  AppTextField({
    this.controller,
    super.key,
    this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.validate,
    this.textInputType = TextInputType.text,
    this.textInputAction,
    this.maxLines,
    this.onSaved,
    this.onTap,
    this.labelText,
    this.readOnly = false,
    this.suffixIcon,
    this.onChanged,
    this.errorText,
    this.initialValue,
    this.backgroundColor,
    this.verticalPadding,
    this.focusNode,
    this.hintColor,
    this.inputTextStyle,
    this.obscuringCharacter,
    this.borderRadius,  this.hintStyle,
  });
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final int? maxLines;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? obscuringCharacter;
  String? Function(String?)? validate;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final void Function(String?)? onSaved;
  final VoidCallback? onTap;
  final bool readOnly;
  final void Function(String?)? onChanged;
  final String? errorText;
  final String? initialValue;
  final Color? backgroundColor;
  final double? verticalPadding;
  final FocusNode? focusNode;
  final Color? hintColor;
  final TextStyle? inputTextStyle;
  final double? borderRadius;
  final TextStyle? hintStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      focusNode: focusNode,
      cursorColor: Colors.pink,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter ?? '•',
      validator: validate,
      maxLines: obscureText == true ? 1 : maxLines,
      keyboardType: textInputType,
      style: inputTextStyle ??
          const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
      decoration: InputDecoration(
        hintStyle: hintStyle,
        prefixIcon: prefixIcon,
        contentPadding:
            EdgeInsets.symmetric(vertical: verticalPadding ?? 8, horizontal: 8),
        hintText: hintText,
        labelText: labelText,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: backgroundColor ?? Colors.white,
        errorText: errorText,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green.shade400),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 10)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green.shade400),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.blue),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 10)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 0.5, color: Colors.black.withOpacity(0.15)),
           borderRadius:  BorderRadius.all(Radius.circular(borderRadius ?? 10)),
        ),
        errorBorder: const OutlineInputBorder(
          // borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
            width: 0.5,
            color: Colors.red,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 0.5, color: Colors.red),
        ),
      ),
      onChanged: onChanged,
      onSaved: onSaved,
      controller: controller,
      onTap: onTap,
      readOnly: readOnly,
    );
  }
}
