import 'package:flutter/material.dart';
import 'package:personal_finance_advisor/src/general_widgets/spacing.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData? labelIcon;
  final String labelText;
  final String hintText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextInputType? keyboardType;
  final bool hideText;
  final Widget? visibilityIcon;

  const CustomTextField({
    super.key,
    required this.controller,
    this.labelIcon,
    required this.labelText,
    required this.hintText,
    this.validator,
    this.onSaved,
    this.keyboardType,
    required this.hideText,
    this.visibilityIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hideText,
      controller: controller,
      validator: validator,
      onSaved: onSaved,
      keyboardType: keyboardType,
      cursorColor: Colors.black,
      style: const TextStyle(
        fontFamily: 'Roboto',
        fontSize: 15,
        color: Color(0xFF3C3C43),
      ),
      decoration: InputDecoration(
        suffixIcon: visibilityIcon,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(50),
        ),
        label: Row(
          children: [
            Icon(
              labelIcon,
              size: 16,
            ),
            const Spacing.mediumWidth(),
            Text(labelText),
          ],
        ),
        labelStyle: const TextStyle(
          fontFamily: 'Roboto',
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Color(0xFF3C3C43),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintText: hintText,
        errorStyle: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 14,
          color: Theme.of(context).colorScheme.error,
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.7),
      ),
    );
  }
}
