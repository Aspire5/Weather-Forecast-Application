import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:weather/controllers/API%20service/openWeatherAPI.dart';
import 'package:mocktail/mocktail.dart';

class MockHTTPClient extends Mock implements Client{}

void main()async{

  late WeatherService service;
  late MockHTTPClient mockHTTPClient;

  setUp((){
    mockHTTPClient = MockHTTPClient();
    service = WeatherService(mockHTTPClient,'key');
  });

  group('fetchCurrentWeather function', (){

    test(
      'given WeatherService class when fetchCurrentWeather is called and status code is 200 then a Map should be returned',
          () async{
        /// Arrange
        when(
              () => mockHTTPClient.get(
              Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=0.0&lon=0.0&exclude=minutely,hourly,daily,alerts&appid=key')
          ),
        ).thenAnswer((invocation) async{
          return Response('''{}''', 200);
        });

        /// Act
        final Map? data = await service.fetchCurrentWeather(0.0, 0.0);

        /// Assert
        expect(data, isA<Map>());
      },
    );

    test(
      'given WeatherService class when fetchCurrentWeather is called and status code is not 200 then a NULL should be returned',
          () async{
        /// Arrange
        when(
              () => mockHTTPClient.get(
              Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=0.0&lon=0.0&exclude=minutely,hourly,daily,alerts&appid=key')
          ),
        ).thenAnswer((invocation) async{
          return Response('''{}''', 400);
        });

        /// Act
        final Map? data = await service.fetchCurrentWeather(0.0, 0.0);

        /// Assert
        expect(data, null);
      },
    );
  });

  group('fetchWeatherForecast function', (){

    test(
      'given WeatherService class when fetchWeatherForecast is called and status code is 200 then a Map should be returned',
          () async{
        /// Arrange
        when(
              () => mockHTTPClient.get(
              Uri.parse('https://api.openweathermap.org/data/2.5/forecast?lat=0.0&lon=0.0&appid=key')
          ),
        ).thenAnswer((invocation) async{
          return Response('''{}''', 200);
        });

        /// Act
        final Map? data = await service.fetchWeatherForecast(0.0, 0.0);

        /// Assert
        expect(data, isA<Map>());
      },
    );

    test(
      'given WeatherService class when fetchWeatherForecast is called and status code is not 200 then a NULL should be returned',
          () async{
        /// Arrange
        when(
              () => mockHTTPClient.get(
              Uri.parse('https://api.openweathermap.org/data/2.5/forecast?lat=0.0&lon=0.0&appid=key')
          ),
        ).thenAnswer((invocation) async{
          return Response('''{}''', 400);
        });

        /// Act
        final Map? data = await service.fetchWeatherForecast(0.0, 0.0);

        /// Assert
        expect(data, null);
      },
    );
  });





}