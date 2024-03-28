import 'package:flutter/material.dart';

class NavText extends StatelessWidget {
  final IconData icon;
  final String text;

  const NavText({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 30),
        const SizedBox(height: 5), // Adjust spacing between icon and text
        Text(
          text,
          style: const TextStyle(
            fontSize: 16, // Adjust the font size as per your requirement
            fontWeight: FontWeight.bold, // Add fontWeight if needed
          ),
        ),
      ],
    );
  }
}
