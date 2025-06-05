import 'package:flutter/material.dart';

class CommonFormField extends StatelessWidget {
  final String labelText;
  final bool isPassword;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Function? onSuffixIconPressed;

  const CommonFormField({
    super.key,
    required this.labelText,
    this.isPassword = false,
    this.suffixIcon,
    this.validator,
    this.controller,
    this.onSuffixIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white),
        border: const OutlineInputBorder(),
        suffixIcon:
            suffixIcon != null ? Icon(suffixIcon, color: Colors.white) : null,
      ),
      validator: validator,
    );
  }
}
