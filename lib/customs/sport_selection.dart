import 'package:flashscore_clone/customs/sports_icons.dart';
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
    return showSportSelection
        ? _buildSportSelectionList()
        : const SizedBox.shrink();
  }

  Widget _buildSportSelectionList() {
    return Container(
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
    );
  }

  Widget _getSportIcon(String sportName) {
    return Icon(
      sportIcons[sportName] ?? Icons.sports,
    );
  }
}
