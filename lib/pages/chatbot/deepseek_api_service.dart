import 'dart:convert';

import 'package:http/http.dart' as http;
// Service class to handle all DeepSeek API stuff

class DeepSeekApiService {

  static const String _baseUrl = 'https://openrouter.ai/api/v1/chat/completions';
  static const String _model = 'deepseek/deepseek-v3.2-exp';
  
  final String _apiKey;

  //Require API key
  DeepSeekApiService({required String apiKey}) : _apiKey = apiKey;
  // ----- SEND MESSAGES TO DEEKSEEK API and return response
  Future<String> sendMessage(String content) async {
    try{
      // Make POST requesto to API
      final response  = await http.post(
        Uri.parse(_baseUrl),
        headers: _getHeaders(),
        body: _getRequestBody(content),
      );

      //check if request was succesful
      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'];
      }
      else{
        print(response.body);
        throw Exception("Failded to get response from DeepSeek: ${response.statusCode}");
      }
    }
    catch (e) {
      // handle any errors during api call
      throw Exception("API Error $e");
    }
  }
  
  // create required headers 
  Map<String, String> _getHeaders() => {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $_apiKey',
    // 'anthropic-version': _apiVersion,
  };

  //format request body according to DeepSeek API Specs
  String _getRequestBody(String content) => jsonEncode({
    'model': _model,
    'messages': [
      {
        "role": 'system',
        "content": "Eres un asistente de IA de apoyo emocional llamado Souly. Responde de forma breve, amable y concisa. Limita tus respuestas a texto plano y emojis apropiados, NUNCA uses formato markdown, ni listas, ni tablas, ni negritas, ni cursivas. ",
      },
      {
        "role": 'user',
        "content": content,
      }
    ],
  });
}