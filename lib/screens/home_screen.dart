import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

import '../constants/colors.dart';
import '../models/weather_model.dart';
import '../services/location_service.dart';
import '../services/weather_service.dart';
import '../widgets/custom_header.dart';
import '../widgets/weather_card.dart';
import '../widgets/quick_actions.dart';
import 'weather_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String location = "Loading...";
  WeatherModel? weather;
  bool isLoading = true;

  // Temporary until teammate connects login
  final String role = "farmer";

  @override
  void initState() {
    super.initState();
    loadWeather();
  }

  Future<void> loadWeather() async {
    try {
      final position = await LocationService.getCurrentLocation();

      final places = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      final city = places.first.locality ?? "Unknown";

      final weatherData = await WeatherService.getCurrentWeather(
        position.latitude,
        position.longitude,
      );

      setState(() {
        location = city;
        weather = weatherData;
        isLoading = false;
      });
    } catch (e) {
      debugPrint(e.toString());

      setState(() {
        location = "Location Error";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: loadWeather,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [

                // Header
                const CustomHeader(
                  farmerName: "Madhan",
                ),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [

                      // Weather
                      if (isLoading)
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 40),
                          child: CircularProgressIndicator(),
                        )
                      else
                        WeatherCard(
                          temperature:
                              "${weather?.temperature.round() ?? "--"}°C",
                          condition: weather?.condition ?? "Unknown",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => WeatherDetailsScreen(
                                  weather: weather,
                                  location: location,
                                ),
                              ),
                            );
                          },
                        ),

                      const SizedBox(height: 28),

                      // Quick Actions
                      QuickActions(role: role),

                      const SizedBox(height: 28),

                      // Tip Card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: AppColors.card,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: AppColors.primary.withValues(alpha: 0.15),
                          ),
                        ),
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Icon(
                              Icons.tips_and_updates_rounded,
                              color: Colors.amber,
                              size: 30,
                            ),

                            SizedBox(width: 14),

                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [

                                  Text(
                                    "Tip of the Day",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  SizedBox(height: 8),

                                  Text(
                                    "Water crops before 9 AM to reduce evaporation and improve water efficiency.",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      height: 1.5,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}