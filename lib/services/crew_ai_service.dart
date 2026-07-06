import 'dart:async';
import 'package:dio/dio.dart';

class CrewAIService {
  static const String _baseUrl =
      "https://farmpilot-farmdirect-ai-assistant-v1-92740c-a0953cce.crewai.com";

  // Replace with your actual CrewAI Bearer Token
  static const String _token = "f213462eaff0";

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
      headers: {
        "Authorization": "Bearer $_token",
        "Content-Type": "application/json",
      },
    ),
  );

  static Future<String> askFarmPilot(String message) async {
    try {
      // STEP 1 - Start Crew
      final kickoffResponse = await _dio.post(
        "/kickoff",
        data: {
          "inputs": {
            "user_request": message,
          },
          "taskWebhookUrl": "",
          "stepWebhookUrl": "",
          "crewWebhookUrl": "",
          "trainingFilename": "",
        },
      );

      final kickoffId = kickoffResponse.data["kickoff_id"];

      // STEP 2 - Wait for completion
      while (true) {
        await Future.delayed(const Duration(seconds: 2));

        final response = await _dio.get("/status/$kickoffId");

        final state = response.data["state"];

        if (state == "SUCCESS") {
          return response.data["result"] ?? "No response";
        }

        if (state == "FAILURE") {
          return "FarmPilot AI failed.";
        }
      }
    } catch (e) {
      return "Error : $e";
    }
  }
}