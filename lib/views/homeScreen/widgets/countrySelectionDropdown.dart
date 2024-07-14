import 'package:flutter/material.dart';
import 'package:country_state_city/country_state_city.dart';

class CountrySelectionDropdown extends StatelessWidget {
  const CountrySelectionDropdown({
    super.key,
    required this.initialValue,
    required this.countries,
    required this.onChanged
  });

  final String? initialValue;
  final List<Country> countries;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xffdbefee),
        borderRadius: BorderRadius.circular(10)
      ),
      child: DropdownButton<String>(
        dropdownColor: Colors.white,
        items: countries.map<DropdownMenuItem<String>>((Country value) {
          return DropdownMenuItem<String>(
          value: value.name,
          child: Text(value.name),
          );
        }).toList(),
        value: initialValue,
        underline: const SizedBox(),
        icon: const SizedBox(),
        onChanged: onChanged,
        alignment: AlignmentDirectional.center,
      ),
    );
  }
}
