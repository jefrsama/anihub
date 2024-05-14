import 'names.dart';

class FranchiseModel {
  Franchise? franchise;
  List<Release> releases = List.empty();
}

class Franchise {
  late String id;
  late String name;
}

class Release {
  late int id;
  late String code;
  late int ordinal;
  Names? names;
}
