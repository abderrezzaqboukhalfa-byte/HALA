import 'package:flutter/material.dart';
import '../widgets/category_button.dart';

/// Placeholder Colors screen — shows a grid of colorful swatches.
class ColorsScreen extends StatelessWidget {
  const ColorsScreen({super.key});

  static const _colors = [
    (emoji: '❤️', name: 'Red',    bg: 0xFFFFD6D6),
    (emoji: '🟠', name: 'Orange', bg: 0xFFFFECC8),
    (emoji: '💛', name: 'Yellow', bg: 0xFFFFF8C0),
    (emoji: '💚', name: 'Green',  bg: 0xFFD6EFD8),
    (emoji: '💙', name: 'Blue',   bg: 0xFFD0F0FD),
    (emoji: '💜', name: 'Purple', bg: 0xFFE8D5F5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFECC8),
        elevation: 0,
        leading: _BackButton(color: const Color(0xFFFF9A3C)),
        title: const Text(
          '🎨 Colors',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3D2C2C),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: _colors
              .map(
                (c) => CategoryButton(
                  label: c.name,
                  emoji: c.emoji,
                  color: Color(c.bg),
                  onTap: () {},
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.arrow_back_rounded,
          color: color,
          size: 28,
        ),
      ),
    );
  }
}
