import 'package:flutter/material.dart';
import 'package:soulence/main.dart';
import 'package:soulence/pages/chatbot/message.dart';

class ChatBubble extends StatelessWidget{
  final Message message;

  const ChatBubble({
    super.key,
    required this.message
  });

  @override
  Widget build(BuildContext context){
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          color: message.isUser ? AppColors.green : AppColors.lightBrown,
          borderRadius: BorderRadius.circular(12), 
        ),
        child: Text(message.content, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}