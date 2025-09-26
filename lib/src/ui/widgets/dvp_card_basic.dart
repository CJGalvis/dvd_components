import 'package:flutter/material.dart';

class CardBasic extends StatelessWidget {
  final String label;
  const CardBasic({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.person_pin_outlined),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const Icon(Icons.arrow_right),
            ],
          ),
        ),
      ),
    );
  }
}
