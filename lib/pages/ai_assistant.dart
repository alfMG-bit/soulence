import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soulence/main.dart';
import 'package:soulence/pages/chatbot/chat_bubble.dart';
import 'package:soulence/pages/chatbot/chat_provider.dart';
import 'package:soulence/widgets/app_drawer.dart';

class AiAssistant extends StatefulWidget{
  const AiAssistant({super.key});

  @override
  State<AiAssistant> createState() => _AiAssistantState();
}

class _AiAssistantState extends State<AiAssistant>{

  final double customFontSize = 12.0;
  final double iconsSize = 20.0;

  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tu apoyo virtual",
          style: TextStyle(
            color: Colors.white,
            // fontsize: font_size,
          ),
        ),
        backgroundColor: AppColors.darkBrown,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),

      drawer: const AppDrawer(),
      
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Consumer<ChatProvider>(
                builder: (context, chatProvider, child){
                  // if its empty, a new conversation
                  if (chatProvider.messages.isEmpty){
                    return const Center(
                      child: Text("Bienvenid@ a Soulence IA, ¿Cómo te sientes hoy?"),
                    );
                  }

                  // chat messages
                  return ListView.builder(
                    itemCount: chatProvider.messages.length,
                    itemBuilder: (context, index) {
                      // get each message
                      final message = chatProvider.messages[index];

                      //return message
                      return ChatBubble(message: message);
                    },
                  );
                }
              ),
            ),
            
            // Loading indicator
            Consumer<ChatProvider>(
              builder: (context, chatProvider, child){
                if(chatProvider.isLoading){
                  return const CircularProgressIndicator();
                }
                return const SizedBox();
              },
            ),
            Row(
              children: [
                // left text box
                Expanded(
                  child: TextField(controller: _controller),
                ),
                // send button at the right part
                IconButton(
                  onPressed: (){
                    if(_controller.text.isNotEmpty){
                      final chatProvider = context.read<ChatProvider>();
                      chatProvider.sendMessage(_controller.text);
                      _controller.clear();
                    }
                  }, 
                  icon: const Icon(
                    Icons.send,
                    color: AppColors.green,
                    )
                  ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}

