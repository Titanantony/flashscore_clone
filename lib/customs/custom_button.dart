import 'package:flashscore_clone/customs/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? action;
  final Size size;
  final Color forecolor;
  final Color backgroundcolor;
  const CustomButton(
      {super.key,
      required this.label,
      this.action,
      this.backgroundcolor = Colors.white,
      this.forecolor = Colors.white,
      this.size = const Size(100, 40)});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: action,
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundcolor,
          //foregroundColor: forecolor,
          shadowColor: Colors.white,
          minimumSize: size),
      child: CustomText(
        text: label,
        textcolor: forecolor,
      ),
    );
  }
}
