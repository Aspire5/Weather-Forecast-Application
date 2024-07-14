import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:weather/singletons/global.dart';
import 'package:weather/views/homeScreen/widgets/citySelectionDropdown.dart';
import 'package:weather/views/homeScreen/widgets/countrySelectionDropdown.dart';
import 'package:weather/views/homeScreen/widgets/homeImage.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff0ee5dd),
                Color(0xffc5e3e2),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            )
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.sizeOf(context).height
            ),
            child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Column(
                      children: [
                        Text(
                          'WEATHER',
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 40,
                          ),
                        ),
                        Text(
                          'FORECAST',
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 40,
                          ),
                        ),
                      ],
                    ),

                    const HomeImage(),

                    CitySelectionDropdown(
                      initialValue: Global().homeScreenController.selectedCity.value,
                      cities: Global().homeScreenController.cities,
                      onChanged: (city){
                        if(city != null){
                          Global().homeScreenController.changeSelectedCity(context, city, false);
                        }
                      }
                    ),

                    CountrySelectionDropdown(
                      initialValue: Global().homeScreenController.selectedCountry.value,
                      countries: Global().homeScreenController.countries,
                      onChanged: (country){
                        if(country != null){
                          Global().homeScreenController.changeSelectedCountry(context, country);
                        }
                      },
                    ),

                  ],
                )
            )
          ),
        ),
      ),
    );
  }
}


