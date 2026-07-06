import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/api_constants.dart';
import '../models/weather_model.dart';

class WeatherService {
  static Future<WeatherModel> getCurrentWeather(
      double lat, double lon) async {
    final url = Uri.parse(
      "${ApiConstants.weatherBaseUrl}"
      "?lat=$lat"
      "&lon=$lon"
      "&appid=${ApiConstants.apiKey}"
      "&units=metric",
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load weather.");
    }
  }
}