/// Represents an animal shown in the Animals screen.
class Animal {
  const Animal({
    required this.name,
    required this.emoji,
    required this.color,
    this.soundAsset,
  });

  /// Display name (kept minimal — mainly for accessibility).
  final String name;

  /// Emoji used as visual placeholder until real images are added.
  final String emoji;

  /// Background card color.
  final int color;

  /// Optional path to a local sound asset, e.g. 'assets/sounds/cat.mp3'.
  final String? soundAsset;
}

/// Built-in animal list used on the Animals screen.
const List<Animal> kAnimals = [
  Animal(
    name: 'Cat',
    emoji: '🐱',
    color: 0xFFFFD6E0,
    soundAsset: 'assets/sounds/cat.mp3',
  ),
  Animal(
    name: 'Dog',
    emoji: '🐶',
    color: 0xFFFFECC8,
    soundAsset: 'assets/sounds/dog.mp3',
  ),
  Animal(
    name: 'Cow',
    emoji: '🐮',
    color: 0xFFD6EFD8,
    soundAsset: 'assets/sounds/cow.mp3',
  ),
  Animal(
    name: 'Sheep',
    emoji: '🐑',
    color: 0xFFE8D5F5,
    soundAsset: 'assets/sounds/sheep.mp3',
  ),
  Animal(
    name: 'Duck',
    emoji: '🦆',
    color: 0xFFD0F0FD,
    soundAsset: 'assets/sounds/duck.mp3',
  ),
  Animal(
    name: 'Elephant',
    emoji: '🐘',
    color: 0xFFDDE0FF,
    soundAsset: 'assets/sounds/elephant.mp3',
  ),
];
