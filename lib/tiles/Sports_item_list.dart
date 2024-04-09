import 'package:flutter/material.dart';

class SportItem extends StatelessWidget {
  final Map<String, IconData> sportIcons;
  final Map<String, dynamic> sport;

  const SportItem({
    required this.sportIcons,
    required this.sport,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        // Get the icon dynamically based on the sport name
        sportIcons[sport['NAME']] ?? Icons.sports,
      ),
      title: Text(sport['NAME']),
    );
  }
}
