import 'package:flutter/material.dart';

class DVPDropdown extends StatelessWidget {
  final List<String> dropdownValues;
  final String labelText;
  final IconData prefixIcon;
  final ValueChanged<String> onSelectedValue;

  const DVPDropdown({
    super.key,
    required this.dropdownValues,
    required this.labelText,
    required this.prefixIcon,
    required this.onSelectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: DropdownButtonFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          return null; // Return null if valid
        },
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          border: const OutlineInputBorder(),
          label: Text(
            labelText,
            style: const TextStyle(fontSize: 18),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
        onChanged: (value) => onSelectedValue.call(value ?? ''),
        items: dropdownValues.map<DropdownMenuItem<String>>(
          (String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          },
        ).toList(),
      ),
    );
  }
}
