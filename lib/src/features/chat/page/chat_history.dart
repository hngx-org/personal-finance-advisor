import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatHistory extends StatelessWidget {
  final List<String> chatList = [
    "user: Hello!",
    "AI: Hi! How can I help you today?",
    "user: I'm looking for information on the latest trends in artificial intelligence.",
    "AI: Sure, here are some of the latest trends in artificial intelligence"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (BuildContext context, int index) {
          final message = chatList[index];
          final isUserMessage = message.startsWith("user:");
          return ChatCard(
            message: message.replaceAll(isUserMessage ? "user: " : "AI: ", ""),
            isUserMessage: isUserMessage,
          );
        },
      ),
    );
  }
}

class ChatCard extends StatelessWidget {
  final String message;
  final bool isUserMessage;

  ChatCard({required this.message, required this.isUserMessage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Align(
        alignment: isUserMessage ? Alignment.topRight : Alignment.topLeft,
        child: Card(
          elevation: 4,
          color: isUserMessage ? Colors.blue : Colors.green,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
