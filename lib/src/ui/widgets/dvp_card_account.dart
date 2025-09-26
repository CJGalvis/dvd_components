import 'package:dvp_components/dvp_components.dart';
import 'package:flutter/material.dart';

class CardAccount extends StatelessWidget {
  final AccountModel? account;
  final String labelEmpty;
  const CardAccount({
    super.key,
    this.account,
    required this.labelEmpty,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: account == null
              ? Center(
                  child: Text(labelEmpty),
                )
              : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.person_pin_outlined),
                        const SizedBox(width: 15),
                        Row(
                          children: [
                            Text(
                              account?.name ?? '',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              account?.lastname ?? '',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              '-',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              account?.birthday ?? '',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    ...?account?.address.map(
                      (e) => Column(
                        children: [
                          const SizedBox(width: 5),
                          Text(
                            e.location,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            e.region,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            e.city,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            height: 1,
                            color: Colors.black38,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
