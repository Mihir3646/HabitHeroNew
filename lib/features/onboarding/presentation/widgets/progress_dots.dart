import 'package:flutter/material.dart';

class ProgressDots extends StatelessWidget {
  final int count;
  final int activeIndex;
  const ProgressDots({super.key, required this.count, required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final active = i == activeIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: active ? 12 : 8,
          height: active ? 12 : 8,
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(active ? 1 : 0.3),
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}
