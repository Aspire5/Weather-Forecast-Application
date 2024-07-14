

import 'package:weather/models/enums/weatherTypes.dart';

class CityWeather {
  String mainTitle;
  String weatherDescription;
  WeatherType weatherType;
  double tempInCelsius;
  double tempInFahrenheit;

  CityWeather({
    required this.mainTitle,
    required this.weatherDescription,
    required this.weatherType,
    required this.tempInCelsius,
    required this.tempInFahrenheit
  });
}