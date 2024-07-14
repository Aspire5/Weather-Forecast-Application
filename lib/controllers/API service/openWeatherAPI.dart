import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class WeatherService {
  static const String apiKey = '763ea499a143d51cbb0d64be1e32cff7';

  static Future<Map<String, dynamic>?> fetchWeather(double lat, double lon) async {
    final String url = 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&exclude=minutely,hourly,daily,alerts&appid=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      log('Failed to load weather data : ${json.decode(response.body)}');
      return null;
    }
  }

  static Future<Map<String, dynamic>?> fetchAdvanceWeather(double lat, double lon, int days) async {
    final String url = 'https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      log('Failed to load weather data : ${json.decode(response.body)}');
      return null;
    }
  }
}