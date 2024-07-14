import 'package:flutter/material.dart';
import 'package:weather/singletons/global.dart';
import '../../../models/forecastDay.dart';
import '../../gifs/loadGifs.dart';

class ForecastCard extends StatelessWidget {
  const ForecastCard({
    super.key,
    required this.day,
  });

  final ForecastDay day;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 150,
      ),
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Global().homeScreenController.getWeatherColor(
                day.weatherType
            ),
            border: Border.all(
              width: 3,
              color: Colors.transparent.withOpacity(0.4),
            ),
            borderRadius: BorderRadius.circular(8)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Global().homeScreenController.isCelsiusSelected.value
                        ? day.tempInFahrenheit
                        : day.tempInCelsius
                    ,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Global().homeScreenController.getTextColor(day.weatherType)
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    'o',
                    style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        color: Global().homeScreenController.getTextColor(day.weatherType)
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              flex: 4,
              child: LoadGif(
                path: Global().homeScreenController.getWeatherPath(day.weatherType),
              ),
            ),
            Flexible(
              flex: 1,
              child: Text(
                day.time,
                style: TextStyle(
                    color: Global().homeScreenController.getTextColor(day.weatherType),
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Text(
                day.date ,
                style: TextStyle(
                    color: Global().homeScreenController.getTextColor(day.weatherType),
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}