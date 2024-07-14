import 'package:flutter/material.dart';
import 'package:weather/models/forecastDay.dart';
import 'package:weather/singletons/global.dart';
import 'package:weather/views/cityWeatherScreen/widgets/forecastCard.dart';
import 'package:weather/views/gifs/loadGifs.dart';
import 'package:weather/views/homeScreen/widgets/citySelectionDropdown.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:get/get.dart';

class CityWeatherScreen extends StatelessWidget{
  const CityWeatherScreen({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Obx(
        () => Global().homeScreenController.cityWeather.value == null
        ? const Center(
          child: CircularProgressIndicator(
            color: Color(0xff08b9b1),
            strokeWidth: 4,
            backgroundColor: Colors.white,
          ),
        )
        : Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: Global().homeScreenController.getWeatherColor(
                  Global().homeScreenController.selectedWeather.value
              )
          ),
          child: SafeArea(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: MediaQuery.sizeOf(context).height,
                  minWidth: MediaQuery.sizeOf(context).width
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CitySelectionDropdown(
                      initialValue: Global().homeScreenController.selectedCity.value,
                      cities: Global().homeScreenController.cities,
                      onChanged: (city){
                        if(city != null){
                          Global().homeScreenController.changeSelectedCity(context, city,true);
                        }
                      }
                  ),
                  Text(
                    Global().homeScreenController.selectedWeather.value.name.toUpperCase(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                        fontSize: 25
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    child: LoadGif(
                      path: Global().homeScreenController.getWeatherPath(
                          Global().homeScreenController.selectedWeather.value
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Global().homeScreenController.isCelsiusSelected.value
                            ? Global().homeScreenController.cityWeather.value!.tempInFahrenheit.toStringAsFixed(1)
                            : Global().homeScreenController.cityWeather.value!.tempInCelsius.toStringAsFixed(1)
                        ,
                        style: TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            color: Global().homeScreenController.getTextColor(Global().homeScreenController.selectedWeather.value)
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        'o',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Global().homeScreenController.getTextColor(Global().homeScreenController.selectedWeather.value)
                        ),
                      )
                    ],
                  ),

                  AnimatedToggleSwitch<bool>.dual(
                    current: Global().homeScreenController.isCelsiusSelected.value,
                    first: false,
                    second: true,
                    spacing: 50.0,
                    style: const ToggleStyle(
                      borderColor: Colors.transparent,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 1.5),
                        ),
                      ],
                    ),
                    borderWidth: 5.0,
                    height: 55,
                    onChanged: (b) => Global().homeScreenController.isCelsiusSelected.value = b,
                    styleBuilder: (b) =>
                        ToggleStyle(indicatorColor: b ? Colors.cyan : Colors.green),
                    iconBuilder: (value) => const Icon(Icons.thermostat),
                    textBuilder: (value) => value
                        ? const Center(
                      child: Text(
                        'Fahrenheit',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                        : const Center(
                      child: Text(
                        'Celsius',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),

                  const Spacer(),

                  SafeArea(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: MediaQuery.sizeOf(context).width,
                        maxHeight: 200
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.transparent.withOpacity(0.2),
                          border: Border.all(
                            width: 3,
                            color: Colors.transparent.withOpacity(0.4),
                          ),
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Global().homeScreenController.forecastedDays.length,
                          itemBuilder: (context,index){
                            ForecastDay day = Global().homeScreenController.forecastedDays.elementAt(index);
                            return ForecastCard(day: day);
                          }
                        ),
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}


