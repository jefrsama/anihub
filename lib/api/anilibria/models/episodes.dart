class Episodes {
  int? first;
  int? last;
  String? string;

  Episodes({
    required this.first,
    required this.last,
    required this.string,
  });

  factory Episodes.fromJson(Map<String, dynamic> json) {
    return Episodes(
      first: json['first'], 
      last: json['last'], 
      string: json['string']
    );
  }
}