import 'package:flutter/material.dart';
import 'package:country_state_city/country_state_city.dart';
import 'package:weather/singletons/global.dart';

class CitySelectionDropdown extends StatelessWidget {
  const CitySelectionDropdown({
    super.key,
    required this.initialValue,
    required this.cities,
    required this.onChanged
  });

  final City? initialValue;
  final List<City> cities;
  final Function(City?)? onChanged;

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xffdbefee),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black,
          width: 2
        )
      ),
      child: DropdownButton<City>(
        isExpanded: true,
        hint: const Center(
          child: Text(
            'Tap to select a city!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        dropdownColor: Colors.white,
        items: cities.map((City value){
          return DropdownMenuItem<City>(
            value: value,
            child: Text(
              value.name,
              overflow: TextOverflow.ellipsis,
            ),
          );
        }).toList(),
        selectedItemBuilder: (BuildContext context) {
          return cities.map((City value) {
            return Center(
              child: Text(
                value.name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            );
          }).toList();
        },
        value: initialValue,
        underline: const SizedBox(),
        icon: const SizedBox(),
        onChanged: onChanged,
        alignment: AlignmentDirectional.center,
      ),
    );
  }
}
