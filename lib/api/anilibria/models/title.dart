import 'names.dart';
import 'franchise.dart';
import 'posters.dart';
import 'status.dart';
import 'title_type.dart';

class Title {
  late int id;
  late String? code;
  late Names? names;
  List<FranchiseModel> franchises = List.empty();
  String? announce;
  late Status status;
  late Posters? posters;
  late int updated;
  late int lastChange;
  TitleType? type;
  List<String>? genres;

  String? description;

  Title({
    required this.id,
    required this.code,
    required this.names,
    required this.franchises,
    required this.announce,
    required this.status,
    required this.posters,
    required this.updated,
    required this.lastChange,
    required this.type,
    required this.genres,
    required this.description,
  });

  factory Title.fromJson(Map<String, dynamic> json) {
    return Title(
      id: json['id'] as int,
      code: json['code'] as String,
      names: Names.fromJson(json['names']),
      franchises: (json['franchises'] as List).map((e) => FranchiseModel.fromJson(e)).toList(),
      announce: json['announce'] as String?,
      status:  Status.fromJson(json['status']),
      posters: Posters.fromJson(json['posters']),
      updated: json['updated'],
      lastChange: json['last_change'],
      type: TitleType.fromJson(json['type']),
      genres: (json['genres'] as List).map((e) => e.toString()).toList(),
      description: json['description']
    );
  }
}
