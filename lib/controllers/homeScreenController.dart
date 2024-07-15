
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:country_state_city/country_state_city.dart';
import 'package:weather/controllers/API%20service/openWeatherAPI.dart';
import 'package:weather/models/cityWeather.dart';
import 'package:weather/models/enums/weatherTypes.dart';
import 'package:weather/views/cityWeatherScreen/cityWeatherScreen.dart';
import 'package:weather/views/dialogs/alertDialog.dart';
import 'package:weather/views/homeScreen/home.dart';

import '../models/forecastDay.dart';

class HomeScreenController extends GetxController{


  /// this will contain list of all countries available in country_state_city package
  late List<Country> countries;

  /// country currently selected by country-selection dropdown (value)
  RxString selectedCountry = 'India'.obs;

  /// city currently selected by city-selection dropdown (value)
  Rx<City?> selectedCity = Rx<City?>(null);

  /// weather of currently selected city
  Rx<WeatherType> selectedWeather = Rx<WeatherType>(WeatherType.thunderstorm);

  /// list of all cities of selected country. it gets populated upon selection of a new country
  List<City> cities = [];

  /// a boolean toggle for temperature - celsius and fahrenheit
  RxBool isCelsiusSelected = false.obs;

  /// contains a CityWeather object containing details about selected city's weather
  Rx<CityWeather?> cityWeather = Rx<CityWeather?>(null);

  /// a list of forecasts of currently selected city, auto-populated when city is selected
  RxList<ForecastDay> forecastedDays = RxList();

  /// initialize our openWeatherAPI object
  WeatherService service = WeatherService(Client(),dotenv.env['API_KEY'] ?? 'API_KEY not found');



  void loadAllCountries()async{
    countries = await getAllCountries();
    cities = await getCountryCities('IN');
    await Future.delayed(const Duration(seconds: 2));
    Get.to(() => const HomeScreen());
  }

  void changeSelectedCountry(BuildContext context, String country) async{
    selectedCity.value = null;
    selectedCountry.value = country;
    for(Country c in countries){
      if(c.name == country){
        cities = await getCountryCities(c.isoCode);
        if(cities.isEmpty){
          showDialog(
            context: context,
            builder: (context){
              return CustomAlertDialog(
                description: 'No cities found!\nSelect another country!',
                onPressed: (){
                  Navigator.pop(context);
                },
              );
            }
          );
        }
      }
    }
  }

  void changeSelectedCity(BuildContext context,City city,bool fromCityScreen){
    cityWeather.value = null;
    selectedCity.value = city;

    double lat = double.parse(city.latitude ?? '0');
    double long = double.parse(city.longitude ?? '0');

    getWeatherOf(context, lat, long, fromCityScreen);
  }

  Color getWeatherColor(WeatherType weather){
    switch(weather){
      case WeatherType.sunny:
        return const Color(0xffde8800);
      case WeatherType.cloudy:
        return const Color(0xfff9b718);
      case WeatherType.rainy:
        return const Color(0xff4dadcb);
      case WeatherType.thunderstorm:
        return const Color(0xff004f59);
      case WeatherType.snow:
        return const Color(0xffffffff);
      case WeatherType.starry:
        return const Color(0xff0d091f);
      case WeatherType.dark:
        return const Color(0xff2d3d65);
    }
  }

  Color getTextColor(WeatherType weather){
    switch(weather){
      case WeatherType.sunny:
        return const Color(0xff090909);
      case WeatherType.cloudy:
        return const Color(0xff090909);
      case WeatherType.rainy:
        return const Color(0xff090909);
      case WeatherType.thunderstorm:
        return const Color(0xffffffff);
      case WeatherType.snow:
        return const Color(0xff090909);
      case WeatherType.starry:
        return const Color(0xffffffff);
      case WeatherType.dark:
        return const Color(0xffffffff);
    }
  }

  String getWeatherPath(WeatherType weather){
    switch(weather){
      case WeatherType.sunny:
        return 'images/sunAnimation.gif';
      case WeatherType.cloudy:
        return 'images/cloudysunny.gif';
      case WeatherType.rainy:
        return 'images/rainy.gif';
      case WeatherType.thunderstorm:
        return 'images/thunderstorm.gif';
      case WeatherType.snow:
        return 'images/snowfall.gif';
      case WeatherType.starry:
        return 'images/starMoon.gif';
      case WeatherType.dark:
        return 'images/cloudyMoon.gif';
    }
  }


  void getWeatherOf(BuildContext context, double lat, double lon, bool fromCityScreen) async{

    /// we need to clear data of previously selected city, otherwise new data will append after previous data
    forecastedDays.clear();

    if(fromCityScreen == false){
      showDialog(
        context: context,
        builder: (context){
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xff08b9b1),
              strokeWidth: 4,
              backgroundColor: Colors.white,
            ),
          );
        }
      );
    }

    Map? data = await service.fetchCurrentWeather(lat, lon);
    Map? forecastData = await service.fetchWeatherForecast(lat, lon);

    debugPrint("DATA = $data");
    debugPrint("forecast DATA = $forecastData");


    /// unloading forecasted weather data into a list of ForecastDay objects
    if(forecastData != null){
      for(Map<String,dynamic> day in forecastData['list']){
        forecastedDays.add(
          ForecastDay(
            date: getDateFromUnix(day['dt']),
            time: getTimeFromUnix(day['dt']),
            tempInCelsius: kelvinToCelsius(day['main']['temp'].toDouble()).toStringAsFixed(1),
            tempInFahrenheit: kelvinToFahrenheit(day['main']['temp'].toDouble()).toStringAsFixed(1),
            weatherType: getWeatherType(day['weather'][0]['main'] ?? '',getHourFromUnix(day['dt']))
          )
        );
      }
    }

    if(data != null) {
      selectedWeather.value = getWeatherType(data['weather'][0]['main'] ?? '', DateTime.now().hour);
      cityWeather.value = CityWeather(
          mainTitle: data['weather'][0]['main'],
          weatherDescription: data['weather'][0]['description'],
          weatherType: selectedWeather.value,
          tempInCelsius: kelvinToCelsius(data['main']['temp']),
          tempInFahrenheit: kelvinToFahrenheit(data['main']['temp'])
      );

      if(fromCityScreen == false){
        /// to pop circular progress indicator
        Navigator.pop(context);
        Get.to(() => const CityWeatherScreen());
      }
    }else{
      showDialog(
        context: context,
        builder: (context){
          return CustomAlertDialog(
            description: "Some error occurred!\nPlease try again later...",
            onPressed: (){
              selectedCity.value = null;
              Navigator.pop(context);
              if(fromCityScreen){
                Get.back();
              }else{
                /// to pop circular progress indicator
                Navigator.pop(context);
              }
            },
          );
        }
      );
    }
  }

  WeatherType getWeatherType(String weather, int hours){
    switch(weather){
      case 'Clear':
        if(hours >= 18 || hours < 6){
          return WeatherType.starry;
        }else{
          return WeatherType.sunny;
        }

      case 'Clouds':
        if(hours >= 18 || hours < 6){
          return WeatherType.dark;
        }else{
          return WeatherType.cloudy;
        }

      case 'Rain':
        return WeatherType.rainy;

      case 'Snow':
        return WeatherType.snow;

      case 'Thunderstorm':
        return WeatherType.thunderstorm;

      case 'Drizzle':
        return WeatherType.rainy;

      default: if(hours >= 18 || hours < 6){
        return WeatherType.starry;
      }else{
        return WeatherType.sunny;
      }
    }
  }

  double kelvinToCelsius(double kelvin) {
    return kelvin - 273.15;
  }

  double kelvinToFahrenheit(double kelvin) {
    return (kelvin - 273.15) * 9/5 + 32;
  }

  String getDateFromUnix(unixTimestamp){

    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);
    return DateFormat('MMMM d').format(dateTime);
  }

  String getTimeFromUnix(unixTimestamp){

    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);
    return DateFormat('HH:mm').format(dateTime);
  }


  int getHourFromUnix(unixTimestamp){

    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(unixTimestamp * 1000);
    return int.parse(DateFormat('HH').format(dateTime));
  }

}