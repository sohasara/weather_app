import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Weather {
  final double temp;
  Weather(this.temp);
  factory Weather.fromjson(Map<String, dynamic> json) {
    return Weather(json['main']['temp']);
  }
}

Future<Weather> fetchAlbum() async {
  final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=667a34715c86a6964e60a2d50ffc394a'));

  // ignore: unrelated_type_equality_checks
  if (response == 200) {
    return Weather.fromjson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load album');
  }
}
