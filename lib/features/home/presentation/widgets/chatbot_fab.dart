import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ChatbotFab extends StatefulWidget {
  const ChatbotFab({super.key});

  @override
  State<ChatbotFab> createState() => _ChatbotFabState();
}

class _ChatbotFabState extends State<ChatbotFab> {
  bool _isOpen = false;

  void _toggleChat() {
    setState(() {
      _isOpen = !_isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (_isOpen)
          Positioned(
            bottom: 95,
            right: 25,
            child: const _ChatWindow().animate().fade(duration: 200.ms).scale(begin: const Offset(0.8, 0.8), curve: Curves.easeOut),
          ),
        Positioned(
          bottom: 25,
          right: 25,
          child: FloatingActionButton(
            backgroundColor: AppColors.secondary,
            onPressed: _toggleChat,
            child: Icon(_isOpen ? Icons.close : Icons.chat_bubble, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class _ChatWindow extends StatelessWidget {
  const _ChatWindow();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 480,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 40,
            offset: const Offset(0, 15),
          ),
        ],
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.accent,
                  child: Text('AI', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Nova Assistant', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    Text('Online', style: TextStyle(color: AppColors.accent, fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: AppColors.bgLight,
              padding: const EdgeInsets.all(16),
              child: ListView(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16).copyWith(bottomLeft: Radius.zero),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 6)],
                      ),
                      child: const Text('Hi! I am Nova Assistant. How can I help you find the right insurance today?'),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _SuggestionChip('Health Insurance'),
                      _SuggestionChip('Car Insurance'),
                      _SuggestionChip('Compare Plans'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              border: Border(top: BorderSide(color: AppColors.borderLight)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: AppColors.borderLight),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: AppColors.primary,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white, size: 18),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SuggestionChip extends StatelessWidget {
  final String label;
  const _SuggestionChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.secondary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.secondary.withOpacity(0.15)),
      ),
      child: Text(
        label,
        style: const TextStyle(color: AppColors.secondary, fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }
}
