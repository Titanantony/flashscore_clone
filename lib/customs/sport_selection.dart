import 'package:flutter/material.dart';

class SportsSelection extends StatelessWidget {
  final bool showSportSelection;
  final List<dynamic> sports;

  const SportsSelection({
    Key? key,
    required this.showSportSelection,
    required this.sports,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Existing content goes here
        const Placeholder(),
        if (showSportSelection)
          Positioned.fill(
            child: Container(
              color: Colors.white,
              child: ListView.builder(
                itemCount: sports.length,
                itemBuilder: (context, index) {
                  final sport = sports[index];
                  return ListTile(
                    leading: _getSportIcon(sport['NAME']),
                    title: Text(sport['NAME']),
                  );
                },
              ),
            ),
          ),
      ],
    );
  }

  Widget _getSportIcon(String sportName) {
    // Your implementation to get the sport icon
    return Icon(
      Icons.sports,
    );
  }
}
