import 'package:flutter/material.dart';

class IconPickerSheet extends StatelessWidget {
  const IconPickerSheet({super.key});

  static const icons = [
    Icons.book,
    Icons.directions_run,
    Icons.fastfood,
    Icons.sports_soccer,
    Icons.pool,
    Icons.music_note,
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 6,
      shrinkWrap: true,
      children: [
        for (final i in icons)
          IconButton(icon: Icon(i), onPressed: () => Navigator.pop(context, i.codePoint)),
      ],
    );
  }
}
