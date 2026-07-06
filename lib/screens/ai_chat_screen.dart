import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/chat_message.dart';
import '../services/crew_ai_service.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/chat_input.dart';
import '../widgets/typing_indicator.dart';

class AIChatScreen extends StatefulWidget {
  const AIChatScreen({super.key});

  @override
  State<AIChatScreen> createState() => _AIChatScreenState();
}

class _AIChatScreenState extends State<AIChatScreen> {
  final TextEditingController _controller = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  final List<ChatMessage> _messages = [];

  bool _isTyping = false;

  @override
  void initState() {
    super.initState();

    _messages.add(
      ChatMessage(
        message:
            "👋 Hello!\n\nI'm FarmPilot AI.\n\nAsk me anything about:\n\n🌾 Selling crops\n🛒 Buying crops\n🌤 Weather\n🐛 Crop diseases\n📈 Market demand",
        isUser: false,
        time: DateTime.now(),
      ),
    );
  }

  Future<void> _sendMessage([String? suggestion]) async {
    final text = suggestion ?? _controller.text.trim();

    if (text.isEmpty) return;

    setState(() {
      _messages.add(
        ChatMessage(
          message: text,
          isUser: true,
          time: DateTime.now(),
        ),
      );

      _isTyping = true;
    });

    _controller.clear();

    _scrollDown();

    final response = await CrewAIService.askFarmPilot(text);

    setState(() {
      _isTyping = false;

      _messages.add(
        ChatMessage(
          message: response,
          isUser: false,
          time: DateTime.now(),
        ),
      );
    });

    _scrollDown();
  }

  void _scrollDown() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Widget _suggestionChip(String text, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ActionChip(
        backgroundColor: AppColors.card,
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 18,
              color: AppColors.primary,
            ),
            const SizedBox(width: 6),
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        onPressed: () => _sendMessage(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.card,
        elevation: 0,
        centerTitle: true,
        title: const Column(
          children: [
            Text(
              "🤖 FarmPilot AI",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2),
            Text(
              "Your Smart Farming Assistant",
              style: TextStyle(
                fontSize: 12,
                color: Colors.white70,
              ),
            )
          ],
        ),
      ),

      body: Column(
        children: [

          const SizedBox(height: 10),

          SizedBox(
            height: 45,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                _suggestionChip(
                  "Sell Crop",
                  Icons.sell,
                ),
                _suggestionChip(
                  "Weather",
                  Icons.cloud,
                ),
                _suggestionChip(
                  "Disease",
                  Icons.bug_report,
                ),
                _suggestionChip(
                  "Buy Crops",
                  Icons.shopping_cart,
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount:
                  _messages.length + (_isTyping ? 1 : 0),
              itemBuilder: (context, index) {
                if (_isTyping &&
                    index == _messages.length) {
                  return const TypingIndicator();
                }

                final msg = _messages[index];

                return ChatBubble(
                  message: msg.message,
                  isUser: msg.isUser,
                );
              },
            ),
          ),

          ChatInput(
            controller: _controller,
            onSend: _sendMessage,
          ),
        ],
      ),
    );
  }
}