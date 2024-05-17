import 'poster.dart';

class Posters {
  Poster? small;
  Poster? medium;
  Poster? original;

  Posters({
    required this.small,
    required this.medium,
    required this.original
  });

  factory Posters.fromJson(Map<String, dynamic> json) {
    return Posters(
      small: Poster.fromJson(json['small']), 
      medium: Poster.fromJson(json['medium']), 
      original: Poster.fromJson(json['original'])
    );
  }
}
