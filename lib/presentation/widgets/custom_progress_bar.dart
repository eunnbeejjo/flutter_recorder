import 'package:flutter/material.dart';
import 'package:flutter_recorder/theme/color_palette.dart';

class CustomProgressBar extends StatelessWidget {
  final double percentage;

  const CustomProgressBar({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: percentage,
      color: ColorPalette.primaryBase,
      backgroundColor: ColorPalette.gray100,
      borderRadius: BorderRadius.circular(10),
    );
  }
}
