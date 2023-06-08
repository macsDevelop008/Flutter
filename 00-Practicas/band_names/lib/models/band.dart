class Band {
  final String id;
  final String name;
  final int votes;
  Band({required this.id, required this.name, required this.votes});

  //Mapa de respuestas con valores ontenidos del back
  factory Band.fromMap(Map<String, dynamic> obj) {
    return Band(id: obj['id'], name: obj['name'], votes: obj['votes']);
  }
}
