import 'package:flutter/material.dart';

/// A large, rounded category button designed for small children.
/// Features a big emoji icon and a short label below it.
class CategoryButton extends StatefulWidget {
  const CategoryButton({
    super.key,
    required this.label,
    required this.emoji,
    required this.color,
    required this.onTap,
  });

  final String label;
  final String emoji;
  final Color color;
  final VoidCallback onTap;

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
      lowerBound: 0.0,
      upperBound: 0.08,
    );
    _scale = Tween<double>(begin: 1.0, end: 0.93).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _onTapDown(TapDownDetails _) async {
    await _controller.forward();
  }

  Future<void> _onTapUp(TapUpDetails _) async {
    await _controller.reverse();
    widget.onTap();
  }

  Future<void> _onTapCancel() async {
    await _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: ScaleTransition(
        scale: _scale,
        child: Container(
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(32),
            boxShadow: const [
              BoxShadow(
                color: Color(0x22000000),
                blurRadius: 12,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.emoji,
                style: const TextStyle(fontSize: 64),
              ),
              const SizedBox(height: 12),
              Text(
                widget.label,
                style: const TextStyle(
                  fontSize: 22,
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
