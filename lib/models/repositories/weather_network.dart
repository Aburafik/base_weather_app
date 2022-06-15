import 'package:http/http.dart';
import 'package:weather_app_v2/models/weather_model.dart';

import '../../privite_keys.dart';

class WeatherNewtwork {
  String url =
      "https://api.openweathermap.org/data/2.5/onecall?lat=33.44&lon=-94.04&daily&appid=$apiKey";

  Future<WeatherApi> getWeatherData() async {
    final Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response.body);
      return weatherApiFromJson(response.body);
    } else {
      throw {Exception("Can't load data")};
    }
  }
}
