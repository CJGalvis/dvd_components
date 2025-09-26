import 'package:flutter/material.dart';

class DVPInput extends StatelessWidget {
  final String labelText;
  final IconData prefixIcon;
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;

  const DVPInput({
    super.key,
    required this.labelText,
    required this.prefixIcon,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          return null; // Return null if valid
        },
        focusNode: focusNode,
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          border: const OutlineInputBorder(),
          label: Text(
            labelText,
            style: const TextStyle(fontSize: 18),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
      ),
    );
  }
}
