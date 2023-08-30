// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: constant_identifier_names, file_names

import 'package:flutter/material.dart';

class AppColors
{
  static const witheColor = Colors.white;

  static const Ksearchcolor = Color(0xD3938AC7);

  static const Kiconcolor = Color(0x88B6B4D2);

  
  static const btn_color = Color(0xFF2C56CC);
  static const darkGreyColor = Colors.grey;
  static const blackColor = Color(0xFF0B0B0C);
  static const redColor = Color(0xE0EF0303);
  static const btn2_Color = Color(0xFFAB7DCE);
  static const Lightblack = Color(0xFF5A5A5A);
}

class WideButton extends StatelessWidget {
  const WideButton(
    this.text, {
    Key? key,
    required,
    this.padding = 0.0,
    this.height = 45,
    required this.onPressed,
    required this.backgroundColor,
    required this.foregroundColor,
  }) : super(key: key);

  /// Should be inside a column, row or flex widget
  final String text;
  final double padding;
  final double height;
  final Color backgroundColor;
  final Color foregroundColor;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: MediaQuery.of(context).size.width <= 500
          ? MediaQuery.of(context).size.width
          : 350,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
          ),
          onPressed: onPressed,
          child: Text(text),
        ),
      ),
    );
  }
}