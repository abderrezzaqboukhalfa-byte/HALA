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

  /// Optional path to a local sound asset, e.g. 'sounds/cat.wav'.
  final String? soundAsset;
}

/// Built-in animal list used on the Animals screen.
const List<Animal> kAnimals = [
  Animal(
    name: 'Cat',
    emoji: '🐱',
    color: 0xFFFFD6E0,
    soundAsset: 'sounds/cat.wav',
  ),
  Animal(
    name: 'Dog',
    emoji: '🐶',
    color: 0xFFFFECC8,
    soundAsset: 'sounds/dog.wav',
  ),
  Animal(
    name: 'Cow',
    emoji: '🐮',
    color: 0xFFD6EFD8,
    soundAsset: 'sounds/cow.wav',
  ),
  Animal(
    name: 'Sheep',
    emoji: '🐑',
    color: 0xFFE8D5F5,
    soundAsset: 'sounds/sheep.wav',
  ),
  Animal(
    name: 'Duck',
    emoji: '🦆',
    color: 0xFFD0F0FD,
  ),
  Animal(
    name: 'Elephant',
    emoji: '🐘',
    color: 0xFFDDE0FF,
    soundAsset: 'sounds/Elephant.mp3',
  ),
];
