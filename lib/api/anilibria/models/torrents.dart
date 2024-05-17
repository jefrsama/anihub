import 'episodes.dart';
import 'torrent.dart';

class Torrents {
  Episodes? episodes;
  List<Torrent>? list;

  Torrents({
    required this.episodes,
    required this.list
  });

  factory Torrents.fromJson(Map<String, dynamic> json) {
    return Torrents(
      episodes: Episodes.fromJson(json['episodes']), 
      list: (json['list'] as List).map((e) => Torrent.fromJson(e)).toList()
    );
  }
}