import 'skips.dart';

class Episode {
  int? episode;
  String? name;
  String? uuid;
  int? createdTimestamp;
  Skips? skips;

  Episode({
    required this.episode,
    required this.name,
    required this.uuid,
    required this.createdTimestamp,
    required this.skips
  });

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      episode: json['episode'], 
      name: json['name'], 
      uuid: json['uuid'], 
      createdTimestamp: json['created_timestamp'], 
      skips: Skips.fromJson(json['skips'])
    );
  }
}