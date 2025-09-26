import 'package:flutter/material.dart';

class DVPInputCalendar extends StatelessWidget {
  final String labelText;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onSelectedValue;

  DVPInputCalendar({
    super.key,
    required this.labelText,
    required this.controller,
    required this.focusNode,
    required this.initialDate,
    required this.firstDate,
    required this.onSelectedValue,
    required this.lastDate,
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
        readOnly: true,
        onTap: () => _showDatePicker(context),
        focusNode: focusNode,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.calendar_month_outlined),
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

  void _showDatePicker(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (date != null) {
      final String dateSelected = date.toLocal().toString().split(' ')[0];

      controller.text = dateSelected;

      onSelectedValue.call(dateSelected);
    }
  }
}
