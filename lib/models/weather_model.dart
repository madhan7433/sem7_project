class WeatherModel {
  final double temperature;
  final String condition;
  final int humidity;
  final double windSpeed;

  WeatherModel({
    required this.temperature,
    required this.condition,
    required this.humidity,
    required this.windSpeed,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temperature: (json['main']['temp'] as num).toDouble(),
      condition: json['weather'][0]['main'],
      humidity: json['main']['humidity'],
      windSpeed: (json['wind']['speed'] as num).toDouble(),
    );
  }
}