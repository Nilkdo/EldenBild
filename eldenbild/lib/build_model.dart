class BuildModel {
  final String id;
  final String title;
  final List<double> stats; // [Vigor, Mente, Resistencia, Fuerza, Destreza, Inteligencia, Fe, Arcanos]
  final String userId;

  BuildModel({
    required this.id,
    required this.title,
    required this.stats,
    this.userId = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'stats': stats,
      'userId': userId,
    };
  }

  factory BuildModel.fromMap(String id, Map<String, dynamic> map) {
    return BuildModel(
      id: id,
      title: map['title'],
      stats: List<double>.from(map['stats']),
      userId: map['userId'] ?? '',
    );
  }
}