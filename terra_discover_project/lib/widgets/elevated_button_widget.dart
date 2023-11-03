import 'package:flutter/material.dart';
import 'package:terra_discover_project/themes/theme_text_styles.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final void Function() onPressed;
  final Color color;
  final String text;

  const ElevatedButtonWidget({
    super.key,
    required this.onPressed,
    required this.color,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18)
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        backgroundColor: color,
        textStyle: ThemeTextStyles.bodyMedium,
      ),
      onPressed: onPressed,
      child: Text(text)
    );
  }
}