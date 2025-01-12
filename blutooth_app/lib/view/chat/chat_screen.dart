import 'dart:io';

import 'package:blutooth_app/styles/colors.dart';
import 'package:blutooth_app/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];

  void _sendMessage(String text) {
    if (text.isEmpty) return;
    setState(() {
      _messages.add({'text': text, 'type': 'text'});
    });
    _controller.clear();
  }

  void _sendImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _messages.add({'image': pickedFile.path, 'type': 'image'});
      });
    }
  }

  void _sendVoiceMessage() {
    // Implement voice message sending functionality here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Jhon Doe',
          style: TextStyle().s28.bold.dark,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Row(
                  children: [
                    Container(
                      width: 200,
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: message['type'] == 'text'
                          ? Text(message['text'])
                          : Container(
                              height: 300,
                              width: 200,
                              child: Image.file(File(message['image']))),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.image),
                  onPressed: _sendImage,
                ),
                // IconButton(
                //   icon: Icon(Icons.mic),
                //   onPressed: _sendVoiceMessage,
                // ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                    ),
                    onSubmitted: _sendMessage,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _sendMessage(_controller.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
