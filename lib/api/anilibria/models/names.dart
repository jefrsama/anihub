class Names {
  String? ru;
  String? en;
  String? alternative;

  Names({
    this.ru,
    this.en,
    this.alternative
  });

  factory Names.fromJson(Map<String, dynamic> json) {
    return Names(
      ru: json['ru'] as String?,
      en: json['en'] as String?,
      alternative: json['alternative'] as String?
    );
  }
}
