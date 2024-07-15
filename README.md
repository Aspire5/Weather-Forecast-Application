# Weather Forecast Application

A Flutter project that allows users to select a country-city pair and get their current weather data as well as 
forecast of up to 5 days! (7 days required paid subscription)

## GIF and Image Credits

I do not own any GIF's and Images used in this project.
All artistic material has been picked up from various online sources, available for free.

## Features

- Selection of countries allows users to check weather of any city of any country from anywhere in the world!
- Animated and beautiful User Interface with use of animations and Gif's
- Toggle to switch temperature preferences between Celsius and Fahrenheit

## GETX - For State Management!

- With GetX, you can define your controllers, manage state, and update UI with minimal code, making it easier to understand and maintain your Flutter application.
- GetX is a popular choice among developers looking for a lightweight, efficient, and easy-to-use state management solution in Flutter applications.

## How to run and use

- Clone this repo, open it in either VS Code or Android Studio. (Expecting that you have Flutter & Dart plugins installed already, if not you can easily find a tutorial to do that online)
- open terminal in your VS Code or Android Studio and simply build an apk using - 'flutter build apk' and install it in your android device to run the app.

- Application is extremely easy to use. After the splash screen ends, the Home screen will appear.
- Home screen provides user with two dropdowns, the one auto-populated with 'India' by default is to select and change the country
- and the dropdown just above it is to select a city from the list of cities of the selected country.
- as soon as you will select a city, the application will auto navigate you to a new screen showing all necessary weather details of current time and forecast of up to 5 days!
- you can tap on the name of the city, appearing on top of the new screen to re-open the dropdown to change and load weather data of a new city!

## Unit Tests

- Unit tests of OpenWeatherAPI calls using Mocktail plugin can be found in openWeatherAPI_test.dart
- Unit tests of state-management logic using getx can be found in homeScreenController_test.dart


