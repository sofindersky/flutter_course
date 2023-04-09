import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weater/models/weather_model2.dart';

class WeatherApiClient {
  String apiId = '7bec6122825fb51803b169df6650bdb6';
  Future<WeatherModel> getCurrentWeather(String? location) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=$apiId&units=metric");

    var response = await http.get(endpoint);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      return WeatherModel.fromJson(body);
    } else {
      throw Exception('Error');
    }
  }
}
