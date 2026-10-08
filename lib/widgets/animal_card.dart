import 'package:flutter/material.dart';
import '../models/animal.dart';

/// A tappable animal card used in the Animals screen.
/// Shows a large emoji and name. Animates (bounces + highlight ring) on tap.
/// Calls [onTap] so the parent can trigger the sound.
class AnimalCard extends StatefulWidget {
  const AnimalCard({
    super.key,
    required this.animal,
    required this.onTap,
  });

  final Animal animal;
  final VoidCallback onTap;

  @override
  State<AnimalCard> createState() => _AnimalCardState();
}

class _AnimalCardState extends State<AnimalCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;
  bool _highlighted = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _scale = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: 1.18),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.18, end: 1.0),
        weight: 50,
      ),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handleTap() async {
    setState(() => _highlighted = true);
    await _controller.forward(from: 0);
    widget.onTap();
    await Future<void>.delayed(const Duration(milliseconds: 600));
    if (mounted) setState(() => _highlighted = false);
  }

  @override
  Widget build(BuildContext context) {
    final cardColor = Color(widget.animal.color);

    return GestureDetector(
      onTap: _handleTap,
      child: ScaleTransition(
        scale: _scale,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: _highlighted
                  ? const Color(0xFFFF6B9D)
                  : Colors.transparent,
              width: 4,
            ),
            boxShadow: [
              BoxShadow(
                color: _highlighted
                    ? const Color(0x55FF6B9D)
                    : const Color(0x22000000),
                blurRadius: _highlighted ? 20 : 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.animal.emoji,
                style: const TextStyle(fontSize: 56),
              ),
              const SizedBox(height: 8),
              Text(
                widget.animal.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3D2C2C),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
