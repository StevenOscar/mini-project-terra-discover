import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:terra_discover_project/themes/theme_colors.dart';
import 'package:terra_discover_project/themes/theme_text_styles.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final TextInputType keyboardType;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final int? maxLines;

  const TextFormFieldWidget({
    super.key,
    this.controller,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    required this.hintText,
    this.inputFormatters,
    this.initialValue,
    this.maxLines = 1
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: ThemeTextStyles.bodyMediumBlack,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.zero),
        ),
        filled: true,
        fillColor: ThemeColors.colorWhite,
        hintText: hintText,
        hintStyle: ThemeTextStyles.bodyMediumBlack,
      ),
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      initialValue: initialValue,
      textAlign: TextAlign.center,
      maxLines: maxLines,
    );
  }
}