import 'names.dart';

class FranchiseModel {
  Franchise? franchise;
  List<Release>? releases = List.empty();

  FranchiseModel({this.franchise, this.releases});

  factory FranchiseModel.fromJson(Map<String, dynamic> json) {
    return FranchiseModel(
      franchise: Franchise.fromJson(json['franchise']),
      releases: (json['releases'] as List).map((e) => Release.fromJson(e)).toList()
    );
  }
}

class Franchise {
  late String id;
  late String name;

  Franchise({required this.id, required this.name});

  factory Franchise.fromJson(Map<String, dynamic> json) {
    return Franchise(
      id: json['id'],
      name: json['name']
    );
  }
}

class Release {
  late int id;
  late String code;
  late int ordinal;
  late Names names;

  Release({
    required this.id,
    required this.code,
    required this.ordinal,
    required this.names
  });

  factory Release.fromJson(Map<String, dynamic> json) {
    return Release(
      id: json['id'],
      code: json['code'],
      ordinal: json['ordinal'],
      names: Names.fromJson(json['names'])
    );
  }
}
