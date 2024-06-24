import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final bool isUser;
  final String message;

  ChatMessage({required this.isUser, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isUser ? Colors.blue[100] : Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(message),
        ),
      ),
    );
  }
}
