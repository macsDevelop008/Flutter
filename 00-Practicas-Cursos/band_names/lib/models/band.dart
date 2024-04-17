class Band {
  final String id;
  final String name;
  final int votes;
  Band({required this.id, required this.name, required this.votes});

  //Mapa de respuestas con valores ontenidos del back
  factory Band.fromMap(Map<String, dynamic> obj) {
    return Band(
        id: obj.containsKey('id') ? obj['id'] : 'no-id',
        name: obj.containsKey('name') ? obj['name'] : 'no-name',
        votes: obj.containsKey('votes') ? obj['votes'] as int : 0);
  }
}