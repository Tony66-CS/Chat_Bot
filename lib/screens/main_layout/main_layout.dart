import 'package:flutter/material.dart';
import 'package:tonyyyyyy/core/colors_manager.dart';
import '../../Gemini/gemini_service.dart';

class MainLayout extends StatefulWidget {
  MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final List<Map<String, String>> messages = [
    {'sender': 'bot', 'text': 'Hello! How can I assist you today?'},];

  final TextEditingController _controller = TextEditingController();
  final GeminiService _geminiService = GeminiService(); // Initialize the Gemini service
  final ScrollController _scrollController = ScrollController(); // ScrollController

  void _sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      messages.add({'sender': 'user', 'text': text});
    });

    _controller.clear();

    try {
      final geminiResponse = await _geminiService.sendMessageToGemini(text);
      setState(() {
        messages.add({'sender': 'bot', 'text': geminiResponse});
      });
      _scrollToLastMessage();
    } catch (e) {
      setState(() {
        messages.add({'sender': 'bot', 'text': 'Error: Unable to connect to Gemini'});
      });
      _scrollToLastMessage();
    }
  }

  void _scrollToLastMessage() {
    Future.delayed(Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent, // Scroll to the end
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chatbot")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,  // Attach the controller to the ListView
              padding: EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                final isUser = msg['sender'] == 'user';
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser ? ColorsManager.blue : Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      msg['text']!,
                      style: TextStyle(color: isUser ? ColorsManager.white : ColorsManager.black),
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(height: 1),
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Type a message",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.send, color: ColorsManager.blue),
                  onPressed: _sendMessage, // Send the message when pressed
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
