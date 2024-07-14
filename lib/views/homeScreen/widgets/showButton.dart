import 'package:flutter/material.dart';
import 'package:weather/singletons/global.dart';
import 'package:weather/views/dialogs/alertDialog.dart';

class ShowButton extends StatelessWidget {
  const ShowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: (){
          if(Global().homeScreenController.selectedCity.value == null){
            showDialog(
              context: context,
              builder: (context){
                return CustomAlertDialog(
                  description: 'Please select a city to continue!',
                  onPressed: (){
                    Navigator.pop(context);
                  },
                );
              }
            );
          }else{
            //Global().homeScreenController.loadCityWeather();
          }
        },
        child: const Text(
          'Continue'
        )
    );
  }
}
