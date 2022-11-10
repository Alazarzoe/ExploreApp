import 'package:flutter/material.dart';

class DetailInfo extends StatelessWidget {
  const DetailInfo(
      {super.key, required this.prefixValue, required this.suffixValue});

  final String prefixValue;
  final String suffixValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        children: [
          Text(
            '$prefixValue:',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 6,
          ),
          Text(
            suffixValue,
            style: const TextStyle(
              color: Color.fromARGB(255, 118, 118, 118),
            ),
          ),
        ],
      ),
    );
  }
}
