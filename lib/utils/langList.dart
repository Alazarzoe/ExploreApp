import 'package:flutter/material.dart';

class LanguageList extends StatelessWidget {
  const LanguageList({super.key, required this.language});

  final String language;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              language,
              style: const TextStyle(fontSize: 16),
            ),
            const Icon(Icons.radio_button_unchecked)
          ],
        ),
      ],
    );
  }
}
