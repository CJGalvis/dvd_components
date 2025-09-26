import 'package:flutter/material.dart';

import '../../domain/domain.dart';

class AddresItem extends StatelessWidget {
  final AddressModel addresItem;
  const AddresItem({
    super.key,
    required this.addresItem,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                addresItem.location.toUpperCase(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 5),
              Text(
                '${addresItem.region} - ${addresItem.city}'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
