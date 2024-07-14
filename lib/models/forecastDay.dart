

import 'package:weather/models/enums/weatherTypes.dart';

class ForecastDay {
  String date;
  String time;
  String tempInCelsius;
  String tempInFahrenheit;
  WeatherType weatherType;

  ForecastDay({
    required this.date,
    required this.time,
    required this.tempInCelsius,
    required this.tempInFahrenheit,
    required this.weatherType
  });
}