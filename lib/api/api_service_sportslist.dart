// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static Future<List<dynamic>> fetchSportsData() async {
    const url = 'https://flashlive-sports.p.rapidapi.com/v1/sports/list';
    const headers = {
      'X-RapidAPI-Key': '1facb4f63amsh97eea296428f361p164741jsn7e4af5d3fda2',
      'X-RapidAPI-Host': 'flashlive-sports.p.rapidapi.com',
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['DATA'];
      } else {
        throw Exception('Failed to fetch sports data');
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}
