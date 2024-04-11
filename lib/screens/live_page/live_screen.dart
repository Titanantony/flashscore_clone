import 'package:flashscore_clone/api/api_live.dart';
import 'package:flashscore_clone/screens/live_page/live_ui_components.dart';
import 'package:flutter/material.dart';

class LiveScoresScreen extends StatefulWidget {
  const LiveScoresScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LiveScoresScreenState createState() => _LiveScoresScreenState();
}

class _LiveScoresScreenState extends State<LiveScoresScreen> {
  late Future<List<Tournament>> tournaments;

  @override
  void initState() {
    super.initState();
    tournaments = fetchData();
  }

  Widget _buildBody() {
    return FutureBuilder<List<Tournament>>(
      future: tournaments,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              final tournament = snapshot.data![index];
              return TournamentCard(tournament: tournament);
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('${snapshot.error}'),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const ToggleDate(),
        Expanded(child: _buildBody()), // Wrap _buildBody() with Expanded
      ],
    );
    // return _buildBody();
  }
}
