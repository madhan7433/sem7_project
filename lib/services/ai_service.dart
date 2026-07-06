class AIService {
  static Future<String> askAI(String prompt) async {
    await Future.delayed(const Duration(seconds: 2));

    return """
🌾 FarmPilot Recommendation

🛒 AI Decision

✅ SELL NOW

Estimated Price

₹35–40/kg

Estimated Revenue

₹18,500

Buyer Demand

High

Recommended Buyers

• Fresh Basket Supermarket

• Green Leaf Restaurant

• Metro Wholesale

Weather

Sunny

AI Confidence

94%

Thank you for using FarmDirect 🌱
""";
  }
}