class Actor {
  final String name;
  final String profilePath;
  final int id;
  final String? character;

  Actor({
    required this.name,
    required this.profilePath,
    required this.id,
    this.character,
  });
}
