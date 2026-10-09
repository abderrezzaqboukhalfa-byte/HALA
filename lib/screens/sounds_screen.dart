import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

/// Placeholder Sounds screen — large tap buttons that play fun sound effects.
class SoundsScreen extends StatefulWidget {
  const SoundsScreen({super.key});

  @override
  State<SoundsScreen> createState() => _SoundsScreenState();
}

class _SoundsScreenState extends State<SoundsScreen> {
  final AudioPlayer _player = AudioPlayer();

  static const _sounds = [
    (emoji: '🥁', name: 'Drum',   asset: 'sounds/drum.mp3',    bg: 0xFFFFD6E0),
    (emoji: '🎸', name: 'Guitar', asset: 'sounds/guitar.mp3',  bg: 0xFFFFECC8),
    (emoji: '🎹', name: 'Piano',  asset: 'sounds/piano.mp3',   bg: 0xFFD6EFD8),
    (emoji: '🎺', name: 'Trumpet',asset: 'sounds/trumpet.mp3', bg: 0xFFDDE0FF),
    (emoji: '🔔', name: 'Bell',   asset: 'sounds/bell.wav',    bg: 0xFFD0F0FD),
    (emoji: '🎵', name: 'Song',   asset: 'sounds/song.mp3',    bg: 0xFFE8D5F5),
  ];

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Future<void> _play(String asset) async {
    try {
      await _player.stop();
      await _player.play(AssetSource(asset));
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sound error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFDDE0FF),
        elevation: 0,
        leading: _BackButton(),
        title: const Text(
          '🎵 Sounds',
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
          itemCount: _sounds.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemBuilder: (context, i) {
            final s = _sounds[i];
            return _SoundButton(
              emoji: s.emoji,
              name: s.name,
              color: Color(s.bg),
              onTap: () => _play(s.asset),
            );
          },
        ),
      ),
    );
  }
}

class _SoundButton extends StatefulWidget {
  const _SoundButton({
    required this.emoji,
    required this.name,
    required this.color,
    required this.onTap,
  });
  final String emoji;
  final String name;
  final Color color;
  final VoidCallback onTap;

  @override
  State<_SoundButton> createState() => _SoundButtonState();
}

class _SoundButtonState extends State<_SoundButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 140),
    );
    _scale = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.15), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.15, end: 1.0), weight: 50),
    ]).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  Future<void> _handleTap() async {
    await _ctrl.forward(from: 0);
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: ScaleTransition(
        scale: _scale,
        child: Container(
          decoration: BoxDecoration(
            color: widget.color,
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
              Text(widget.emoji, style: const TextStyle(fontSize: 52)),
              const SizedBox(height: 8),
              Text(
                widget.name,
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
          color: Color(0xFF7B83EB),
          size: 28,
        ),
      ),
    );
  }
}
