import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

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

  final String role = "farmer";

  @override
  void initState() {
    super.initState();
    loadWeather();
  }

  String greeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return "Good Morning";
    } else if (hour < 17) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
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
      backgroundColor: const Color(0xFF0B0B0B),
            body: SafeArea(
        child: RefreshIndicator(
          color: const Color(0xFF017422),
          backgroundColor: const Color(0xFF181818),
          onRefresh: loadWeather,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// HEADER
                const CustomHeader(
                  farmerName: "Madhan",
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    20,
                    24,
                    20,
                    20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        greeting(),
                        style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 14,
                        ),
                      ),

                      const SizedBox(height: 6),

                      const Text(
                        "Madhan 👋",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Row(
                        children: [

                          const Icon(
                            Icons.location_on_rounded,
                            color: Color(0xFF017422),
                            size: 18,
                          ),

                          const SizedBox(width: 6),

                          Expanded(
                            child: Text(
                              location,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 28),

                      /// TODAY'S WEATHER
                      const Text(
                        "Today's Weather",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 16),
                                            if (isLoading)
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 40,
                            ),
                            child: CircularProgressIndicator(
                              color: Color(0xFF017422),
                            ),
                          ),
                        )
                      else
                        WeatherCard(
                          temperature:
                              "${weather?.temperature.round() ?? "--"}°C",
                          condition:
                              weather?.condition ?? "Unknown",
                          location: location,
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

                      const SizedBox(height: 32),

                      /// QUICK ACTIONS
                      const Text(
                        "Quick Actions",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 18),

                      QuickActions(role: role),

                      const SizedBox(height: 32),

                      /// AI TIP
                      const Text(
                        "AI Farming Tip",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 16),

                                            Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF181818),
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(
                            color: const Color(0xFF017422)
                                .withValues(alpha: .25),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [

                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: const Color(0xFF017422)
                                    .withValues(alpha: .15),
                                borderRadius:
                                    BorderRadius.circular(18),
                              ),
                              child: const Icon(
                                Icons.lightbulb_outline_rounded,
                                color: Color(0xFF017422),
                                size: 30,
                              ),
                            ),

                            const SizedBox(width: 18),

                            const Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [

                                  Text(
                                    "Today's AI Suggestion",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight:
                                          FontWeight.bold,
                                    ),
                                  ),

                                  SizedBox(height: 10),

                                  Text(
                                    "Based on today's weather, irrigate your crops before 9 AM to minimize evaporation. Continue monitoring soil moisture for better yield.",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                      height: 1.6,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 40),
                                            Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF181818),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xFF017422)
                                .withValues(alpha: 0.20),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                color: const Color(0xFF017422)
                                    .withValues(alpha: 0.15),
                                borderRadius:
                                    BorderRadius.circular(16),
                              ),
                              child: const Icon(
                                Icons.lightbulb_outline_rounded,
                                color: Color(0xFF017422),
                                size: 28,
                              ),
                            ),

                            const SizedBox(width: 16),

                            const Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Today's AI Suggestion",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  SizedBox(height: 8),

                                  Text(
                                    "Water crops before 9 AM to reduce evaporation. Based on today's weather, irrigation in the early morning will improve water efficiency and crop health.",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                      height: 1.6,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 40),
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