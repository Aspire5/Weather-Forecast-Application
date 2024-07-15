import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  setUp(
    () async {
      await dotenv.load(fileName: ".env");
    }
  );

  test('given .env file when it is loaded and searched for API_KEY then it should return API_KEY as String value',
    (){

      String? apiKey = dotenv.env['API_KEY'];

      expect(apiKey, isA<String>());
    }
  );

}