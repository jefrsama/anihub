class TitleType {
  String? fullString;
  int? code;
  String? string;
  int? episodes;
  int? length;
  
  TitleType({
    required this.fullString,
    required this.code,
    required this.string,
    required this.episodes,
    required this.length,
  });

  factory TitleType.fromJson(Map<String, dynamic> json) {
    return TitleType(
      fullString: json['full_string'], 
      code: json['code'],
      string: json['string'], 
      episodes: json['episodes'], 
      length: json['length']
    );
  }
}
