import 'dart:ffi';

import 'names.dart';
import 'franchise.dart';
import 'posters.dart';
import 'status.dart';
import 'title_type.dart';

class Title {
  late int id;
  late String code;
  late Names names;
  List<FranchiseModel> franchises = List.empty();
  String? announce;
  late Status status;
  late Posters? posters;
  late LongLong updated;
  late LongLong lastChange;
  TitleType? type;

  Title({
    required this.id,
    required this.code,
    required this.names,
    //required this.franchises,
    // required this.announce,
    // required this.status,
    // required this.posters,
    // required this.updated,
    // required this.lastChange,
    // required this.type
  });

  factory Title.fromJson(Map<String, dynamic> json) {
    return Title(
      id: json['id'] as int,
      code: json['code'] as String,
      names: Names.fromJson(json['names']),
      //franchises: json['franchises'],
      // announce: json['announce'] as String?,
      // status: json['status'],
      // posters: json['posters'],
      // updated: json['updated'],
      // lastChange: json['lastChange'],
      // type: json['type']
    );
  }
}
