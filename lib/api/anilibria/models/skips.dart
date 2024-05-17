class Skips {
  List? opening;
  List? ending;

  Skips({
    required this.opening,
    required this.ending,
  });

  factory Skips.fromJson(Map<String, dynamic> json) {
    return Skips(
      opening: json['opening'] as List<Map<String, dynamic>>, 
      ending: json['ending'] as List<Map<String, dynamic>>,
    );
  }
}