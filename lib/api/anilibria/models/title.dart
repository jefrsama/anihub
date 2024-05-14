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
  late String announce;
  late Status status;
  late Posters? posters;
  late LongLong updated;
  late LongLong last_change;
  TitleType? type;
}
