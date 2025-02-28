import 'package:fast_block/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatbotScreen extends StatefulWidget {
  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final _textController = TextEditingController();
  final _scrollController = ScrollController();
  final _model = GenerativeModel(
    model: 'gemini-2.0-flash',
    apiKey:
        'AIzaSyDa1yfM1kBub2VrFGqADtOrzPi6ITieQAo', // Replace with your API key
  );
  final _chatHistory = <Content>[];
  bool _loading = false;

  Future<void> _sendMessage() async {
    setState(() {
      _loading = true;
    });

    final prompt = _textController.text;
    _textController.clear();

    // Add user message to chat history
    _chatHistory.add(Content.text(prompt));

    try {
      // Generate response from the model
      final response = await _model.generateContent(_chatHistory);

      // Add model's response to chat history
      setState(() {
        _loading = false;
        _chatHistory.add(response.candidates.first.content);
      });

      // Scroll to the bottom of the chat
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } catch (e) {
      setState(() {
        _loading = false;
      });
      print('Error: $e');
      // Handle error (e.g., show a snackbar or dialog)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
          backgroundColor: AppColors.background,
          title: Center(
              child: Text(
            'Ask Customer Service',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ))),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Flexible(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _chatHistory.length,
                  itemBuilder: (context, index) {
                    final content = _chatHistory[index];

                    // Extract text from the content parts
                    final text = content.parts
                        .whereType<TextPart>() // Filter only TextPart objects
                        .map((part) => part.text)
                        .join(' ');

                    return ListTile(
                      title: Text(
                        text,
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        content.role == 'user' ? 'You' : 'Cusomer Service',
                        style: TextStyle(
                          color: content.role == 'user'
                              ? Colors.blue
                              : Colors.green,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textController,
                        decoration:
                            InputDecoration(labelText: 'Type a message'),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.send,
                        color: AppColors.textwhite,
                      ),
                      onPressed: _loading ? null : _sendMessage,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}














/*import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatbotScreen extends StatefulWidget {
  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final _textController = TextEditingController();
  final _scrollController = ScrollController();
  final _model = GenerativeModel(
      model: 'gemini-2.0-flash',
      apiKey: 'AIzaSyDa1yfM1kBub2VrFGqADtOrzPi6ITieQAo');
  final _chatHistory = <Content>[];
  bool _loading = false;

  Future<void> _sendMessage() async {
    setState(() {
      _loading = true;
    });
    final prompt = _textController.text;
    _textController.clear();
    _chatHistory.add(Content.text(prompt));

    try {
      final response = await _model.generateContent(_chatHistory);
      setState(() {
        _loading = false;
        _chatHistory.add(response.candidates.first.content);
      });
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } catch (e) {
      setState(() {
        _loading = false;
      });
      print('Error: $e');
      //Handle Error.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gemini Chatbot')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _chatHistory.length,
              itemBuilder: (context, index) {
                final content = _chatHistory[index];
                return ListTile(
                  title:
                      Text(content.parts.map((part) => part()).join()),
                  // Customize message display
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(labelText: 'Type a message'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _loading ? null : _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
*/