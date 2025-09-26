import 'package:flutter/material.dart';

class DVPHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const DVPHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
