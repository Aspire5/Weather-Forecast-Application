import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:get/get.dart';

class WeatherService {

  final Client client;
  final String apiKey;

  WeatherService(this.client, this.apiKey);

  Future<Map<String, dynamic>?> fetchCurrentWeather(double lat, double lon) async {

    final String url = 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&exclude=minutely,hourly,daily,alerts&appid=$apiKey';

    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      log('Failed to load weather data : ${json.decode(response.body)}');
      return null;
    }
  }

  Future<Map<String, dynamic>?> fetchWeatherForecast(double lat, double lon) async {
    final String url = 'https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$apiKey';

    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      log('Failed to load weather data : ${json.decode(response.body)}');
      return null;
    }
  }
}