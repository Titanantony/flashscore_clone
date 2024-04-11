import 'package:flashscore_clone/constants/constant.dart';
import 'package:flutter/material.dart';

// Data Models
class Tournament {
  final String name;
  final String header;
  final String countryName;
  final String shortName;
  final String tournamentImage;
  final List<Event> events;

  Tournament({
    required this.name,
    required this.header,
    required this.countryName,
    required this.shortName,
    required this.tournamentImage,
    required this.events,
  });

  factory Tournament.fromJson(Map<String, dynamic> json) {
    final events = (json['EVENTS'] as List)
        .map((eventJson) => Event.fromJson(eventJson))
        .toList();

    return Tournament(
      name: json['NAME'],
      header: json['HEADER'],
      countryName: json['COUNTRY_NAME'],
      shortName: json['SHORT_NAME'],
      tournamentImage: json['TOURNAMENT_IMAGE'],
      events: events,
    );
  }
}

class Event {
  final String eventId;
  final int startTime;
  final String stage;
  final String homeTeamName;
  final String homeTeamScore;
  final String awayTeamName;
  final String awayTeamScore;

  Event({
    required this.eventId,
    required this.startTime,
    required this.stage,
    required this.homeTeamName,
    required this.homeTeamScore,
    required this.awayTeamName,
    required this.awayTeamScore,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      eventId: json['EVENT_ID'],
      startTime: json['START_TIME'],
      stage: json['STAGE'],
      homeTeamName: json['HOME_NAME'],
      homeTeamScore: json['HOME_SCORE_CURRENT'],
      awayTeamName: json['AWAY_NAME'],
      awayTeamScore: json['AWAY_SCORE_CURRENT'],
    );
  }
}
// UI components for live

class TournamentCard extends StatelessWidget {
  final Tournament tournament;

  const TournamentCard({required this.tournament, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Image.network(tournament.tournamentImage),
            title: Text(tournament.name),
            subtitle: Text(tournament.countryName),
            tileColor: nextcolor,
          ),
          ...tournament.events.map((event) {
            return Column(
              children: [
                EventCard(event: event), // Use EventCard here
                const Divider(
                  thickness: 2,
                  color: nextcolor,
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({required this.event, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(event.homeTeamName),
          Text(event.awayTeamName),
        ],
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          DefaultTextStyle(
            style: const TextStyle(color: othercolor), // Change the color here
            child: Text(event.homeTeamScore),
          ),
          const SizedBox(
            height: 10,
          ),
          DefaultTextStyle(
            style: const TextStyle(color: othercolor), // Change the color here
            child: Text(event.awayTeamScore),
          ),
        ],
      ),
    );
  }
}
