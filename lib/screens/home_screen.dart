import 'package:flutter/material.dart';
import 'animals_screen.dart';
import 'colors_screen.dart';
import 'numbers_screen.dart';
import 'sounds_screen.dart';
import '../widgets/category_button.dart';

/// The main home screen. Shows Hala's name and 4 large category buttons.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9F0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ── Title ──────────────────────────────────────────────────
              const _HalaTitle(),
              const SizedBox(height: 20),
              // ── Category Grid ──────────────────────────────────────────
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    CategoryButton(
                      label: 'Animals',
                      emoji: '🐾',
                      color: const Color(0xFFFFD6E0),
                      onTap: () => _navigate(context, const AnimalsScreen()),
                    ),
                    CategoryButton(
                      label: 'Colors',
                      emoji: '🎨',
                      color: const Color(0xFFFFECC8),
                      onTap: () => _navigate(context, const ColorsScreen()),
                    ),
                    CategoryButton(
                      label: 'Numbers',
                      emoji: '🔢',
                      color: const Color(0xFFD6EFD8),
                      onTap: () => _navigate(context, const NumbersScreen()),
                    ),
                    CategoryButton(
                      label: 'Sounds',
                      emoji: '🎵',
                      color: const Color(0xFFDDE0FF),
                      onTap: () => _navigate(context, const SoundsScreen()),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  void _navigate(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      PageRouteBuilder<void>(
        pageBuilder: (_, animation, __) => screen,
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.92, end: 1.0).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
              ),
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 280),
      ),
    );
  }
}

// ── Private widgets ────────────────────────────────────────────────────────

class _HalaTitle extends StatelessWidget {
  const _HalaTitle();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          '👧',
          style: TextStyle(fontSize: 56),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFFFF6B9D), Color(0xFFFF9A3C)],
          ).createShader(bounds),
          child: const Text(
            'Hala',
            style: TextStyle(
              fontSize: 52,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: 2,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
