import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather/models/enums/weatherTypes.dart';
import 'package:weather/singletons/global.dart';

void main()async{

  await dotenv.load(fileName: ".env");

  group('given homeScreenController class when getWeatherType function is called and weather is Clear',
    (){

      test("given homeScreenController class when getWeatherType function is called and weather is Clear and hours is 18 then WeatherType.starry should be returned",
              (){
            WeatherType weather = Global().homeScreenController.getWeatherType('Clear', 18);

            expect(weather, WeatherType.starry);
          }
      );

      test("given homeScreenController class when getWeatherType function is called and weather is Clear and hours is 6 then WeatherType.sunny should be returned",
              (){
            WeatherType weather = Global().homeScreenController.getWeatherType('Clear', 6);

            expect(weather, WeatherType.sunny);
          }
      );

      test("given homeScreenController class when getWeatherType function is called and weather is Clear and hours is between 18:00 to 6:00 then WeatherType.sunny should be returned",
              (){
            WeatherType weather = Global().homeScreenController.getWeatherType('Clear', 1);
            expect(weather, WeatherType.starry);

            WeatherType weather2 = Global().homeScreenController.getWeatherType('Clear', 23);
            expect(weather2, WeatherType.starry);
          }
      );

      test("given homeScreenController class when getWeatherType function is called and weather is Clear and hours is between 6:00 to 18:00 then WeatherType.sunny should be returned",
              (){
            WeatherType weather = Global().homeScreenController.getWeatherType('Clear', 7);
            expect(weather, WeatherType.sunny);

            WeatherType weather2 = Global().homeScreenController.getWeatherType('Clear', 17);
            expect(weather2, WeatherType.sunny);
          }
      );

    }
  );

  group('given homeScreenController class when getWeatherType function is called and weather is Clouds',
    (){

        test("given homeScreenController class when getWeatherType function is called and weather is Clouds and hours is 18 then WeatherType.starry should be returned",
                (){
              WeatherType weather = Global().homeScreenController.getWeatherType('Clouds', 18);

              expect(weather, WeatherType.dark);
            }
        );

        test("given homeScreenController class when getWeatherType function is called and weather is Clouds and hours is 6 then WeatherType.sunny should be returned",
                (){
              WeatherType weather = Global().homeScreenController.getWeatherType('Clouds', 6);

              expect(weather, WeatherType.cloudy);
            }
        );

        test("given homeScreenController class when getWeatherType function is called and weather is Clouds and hours is between 18:00 to 6:00 then WeatherType.sunny should be returned",
                (){
              WeatherType weather = Global().homeScreenController.getWeatherType('Clouds', 1);
              expect(weather, WeatherType.dark);

              WeatherType weather2 = Global().homeScreenController.getWeatherType('Clouds', 23);
              expect(weather2, WeatherType.dark);
            }
        );

        test("given homeScreenController class when getWeatherType function is called and weather is Clouds and hours is between 6:00 to 18:00 then WeatherType.sunny should be returned",
                (){
              WeatherType weather = Global().homeScreenController.getWeatherType('Clouds', 7);
              expect(weather, WeatherType.cloudy);

              WeatherType weather2 = Global().homeScreenController.getWeatherType('Clouds', 17);
              expect(weather2, WeatherType.cloudy);
            }
        );

      }
  );

  group('given homeScreenController class when getWeatherType function is called and weather is XYZ then default switch should be triggered',
    (){
        test("given homeScreenController class when getWeatherType function is called and weather is XYZ and hours is 18 then WeatherType.starry should be returned",
          (){
              WeatherType weather = Global().homeScreenController.getWeatherType('XYZ', 18);

              expect(weather, WeatherType.starry);
            }
        );

        test("given homeScreenController class when getWeatherType function is called and weather is XYZ and hours is 6 then WeatherType.sunny should be returned",
          (){
              WeatherType weather = Global().homeScreenController.getWeatherType('XYZ', 6);

              expect(weather, WeatherType.sunny);
            }
        );

        test("given homeScreenController class when getWeatherType function is called and weather is XYZ and hours is between 18:00 to 6:00 then WeatherType.sunny should be returned",
          (){
              WeatherType weather = Global().homeScreenController.getWeatherType('XYZ', 1);
              expect(weather, WeatherType.starry);

              WeatherType weather2 = Global().homeScreenController.getWeatherType('XYZ', 23);
              expect(weather2, WeatherType.starry);
            }
        );

        test("given homeScreenController class when getWeatherType function is called and weather is XYZ and hours is between 6:00 to 18:00 then WeatherType.sunny should be returned",
          (){
              WeatherType weather = Global().homeScreenController.getWeatherType('XYZ', 7);
              expect(weather, WeatherType.sunny);

              WeatherType weather2 = Global().homeScreenController.getWeatherType('XYZ', 17);
              expect(weather2, WeatherType.sunny);
            }
        );

      }
  );

}