
import 'package:weather/controllers/homeScreenController.dart';
import 'package:get/get.dart';

class Global {

  Global._privateConstructor();

  static final Global _instance = Global._privateConstructor();

  factory Global() {
    return _instance;
  }

  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  String truncateWithEllipsis(int cutoff, String myString) {
    return (myString.length <= cutoff)
        ? myString
        : '${myString.substring(0, cutoff)}...';
  }

}
