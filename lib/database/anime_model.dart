class Anime {
  int id;
  String title;
  String description;
  String genres;

  Anime({required this.id, required this.title, required this.description, required this.genres});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'genres': genres,
    };
  }

  factory Anime.fromMap(Map<String, dynamic> map) {
    return Anime(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      genres: map['genres'],
    );
  }
}
