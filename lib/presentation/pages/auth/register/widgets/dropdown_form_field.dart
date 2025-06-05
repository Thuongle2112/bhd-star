import 'package:flutter/material.dart';

class DropdownFormField<T> extends StatelessWidget {
  final String labelText;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;

  const DropdownFormField({
    super.key,
    required this.labelText,
    required this.items,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white),
        border: const OutlineInputBorder(),
      ),
      items: items,
      onChanged: onChanged,
    );
  }
}
