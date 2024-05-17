import 'episodes.dart';

class Player {
  String? host;
  Episodes? episodes;
  Map<String, Episodes>? list;

  Player({
    required this.host,
    required this.episodes,
    required this.list,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      host: json['host'], 
      episodes: Episodes.fromJson(json['episodes']),
      list: json['list']
    );
  }
}