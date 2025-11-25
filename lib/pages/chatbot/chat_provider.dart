import 'package:flutter/material.dart';
import 'package:soulence/pages/chatbot/deepseek_api_service.dart';
import 'package:soulence/pages/chatbot/message.dart';

class ChatProvider with ChangeNotifier{
  //DeepSeek API Service
  final _apiService = DeepSeekApiService(apiKey: 'HERE GOES YOUR API KEY');

  // Mesages & Loading
  final List<Message> _messages = [];
  bool _isLoading = false;

  //Getters
  List<Message> get messages => _messages;
  bool get isLoading => _isLoading;
  
  //Send message
  Future<void> sendMessage(String content) async {
    //prevent empty sends
    if (content.trim().isEmpty) return;

    // user message
    final userMessage = Message(
      content: content,
      isUser: true,
      timestamp: DateTime.now(),
    );

    // add user message to chat
    _messages.add(userMessage);

    //update
    notifyListeners();

    //start loading
    _isLoading = true;

    // update
    notifyListeners();

    // send message & receive response
    try {
      final response = await _apiService.sendMessage(content);

      //response message from ai
      final responseMessage = Message(
        content: response,
        isUser: false,
        timestamp: DateTime.now(),
      );

      // ad ai message to chat
      _messages.add(responseMessage);
      _isLoading = false;
      notifyListeners();
    }
    catch(e){
      final errorMessage = Message(
        content: "Sorry, I encoutered an issue.. $e",
        isUser: false,
        timestamp: DateTime.now(),
      );
      //add error message to chat
      _messages.add(errorMessage);
      //finished loading...
      _isLoading = false;
      //update
      notifyListeners();
    }
  }
}
