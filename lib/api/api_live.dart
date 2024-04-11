import 'dart:convert';
import 'package:flashscore_clone/screens/live_page/live_ui_components.dart';
import 'package:http/http.dart' as http;

// Live api service

Future<List<Tournament>> fetchData() async {
  // ignore: unused_local_variable
  const url = 'https://flashlive-sports.p.rapidapi.com/v1/events/live-list';
  final queryParameters = {
    'timezone': '3',
    'sport_id': '1',
    'locale': 'en_INT',
  };

  final headers = {
    'X-RapidAPI-Key': '1facb4f63amsh97eea296428f361p164741jsn7e4af5d3fda2',
    'X-RapidAPI-Host': 'flashlive-sports.p.rapidapi.com',
  };

  final uri = Uri.https('flashlive-sports.p.rapidapi.com',
      '/v1/events/live-list', queryParameters);

  final response = await http.get(uri, headers: headers);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body)['DATA'] as List;
    return data.map((json) => Tournament.fromJson(json)).toList();
  } else {
    throw Exception('Failed to fetch data');
  }
}
