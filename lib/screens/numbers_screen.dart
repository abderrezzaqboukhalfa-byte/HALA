import 'package:flutter/material.dart';

/// Placeholder Numbers screen — shows large number tiles 1–10.
class NumbersScreen extends StatelessWidget {
  const NumbersScreen({super.key});

  static const _numbers = [
    (n: '1', emoji: '🍎'), (n: '2', emoji: '🍊'), (n: '3', emoji: '🍋'),
    (n: '4', emoji: '🍇'), (n: '5', emoji: '🍓'), (n: '6', emoji: '🍒'),
    (n: '7', emoji: '🥝'), (n: '8', emoji: '🍑'), (n: '9', emoji: '🫐'),
    (n: '10', emoji: '🍍'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD6EFD8),
        elevation: 0,
        leading: _BackButton(),
        title: const Text(
          '🔢 Numbers',
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
        child: GridView.builder(
          itemCount: _numbers.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemBuilder: (context, i) {
            final item = _numbers[i];
            return _NumberTile(number: item.n, emoji: item.emoji);
          },
        ),
      ),
    );
  }
}

class _NumberTile extends StatelessWidget {
  const _NumberTile({required this.number, required this.emoji});
  final String number;
  final String emoji;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFD6EFD8),
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 40)),
          const SizedBox(height: 8),
          Text(
            number,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w900,
              color: Color(0xFF2D6A4F),
            ),
          ),
        ],
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
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
        child: const Icon(
          Icons.arrow_back_rounded,
          color: Color(0xFF52B788),
          size: 28,
        ),
      ),
    );
  }
}
