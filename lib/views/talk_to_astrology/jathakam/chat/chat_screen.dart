import 'package:flutter/material.dart';
import 'package:astrologer_app/views/util/colors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> messages = [
    {"text": "Hello! How can I help you today?", "isUser": false},
    {"text": "I want to know about my career.", "isUser": true},
  ];

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    setState(() {
      messages.add({
        "text": _messageController.text.trim(),
        "isUser": true,
      });
    });

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.red,
        title: const Text("Vaikundam Astrologer"),
        centerTitle: true,
      ),
      body: Column(
        children: [

          /// 🔹 Chat Messages
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return _buildMessage(
                  messages[index]["text"],
                  messages[index]["isUser"],
                );
              },
            ),
          ),

          /// 🔹 Message Input Area
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: const BoxDecoration(
              color: AppColors.darkGrey,
            ),
            child: Row(
              children: [

                /// Text Field
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    style: const TextStyle(color: AppColors.white),
                    decoration: InputDecoration(
                      hintText: "Type your message...",
                      hintStyle:
                          const TextStyle(color: AppColors.lightGrey),
                      filled: true,
                      fillColor: AppColors.black,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                /// Send Button
                CircleAvatar(
                  backgroundColor: AppColors.orange,
                  child: IconButton(
                    icon: const Icon(Icons.send,
                        color: AppColors.black),
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 Message Bubble
  Widget _buildMessage(String text, bool isUser) {
    return Align(
      alignment:
          isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        constraints: const BoxConstraints(maxWidth: 250),
        decoration: BoxDecoration(
          color: isUser ? AppColors.orange : AppColors.darkGrey,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft:
                isUser ? const Radius.circular(16) : Radius.zero,
            bottomRight:
                isUser ? Radius.zero : const Radius.circular(16),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isUser
                ? AppColors.black
                : AppColors.white,
          ),
        ),
      ),
    );
  }
}
