import 'dart:convert';

import 'package:weatherapp/constants/apiKey.dart'; // Ensure the correct path
import 'package:http/http.dart' as http;
import 'package:weatherapp/models/weatherModel.dart';

class WeatherAPI {
  final String baseURL = 'http://api.weatherapi.com/v1/current.json';

   Future <WeatherModel?> getWeather(String location) async {
    String apiURL = '$baseURL?key=$apikey&q=$location';
    try {
      var response = await http.get(Uri.parse(apiURL));
      if (response.statusCode == 200) {
        return WeatherModel.fromJson(jsonDecode(response.body));
      } else {
        print("Failed to load weather. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Failed to load weather. Error: $e");
    }
  }
}
