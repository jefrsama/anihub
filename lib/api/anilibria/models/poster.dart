class Poster {
  String? url;
  String? rawBase64File;

  Poster({required this.url, required this.rawBase64File});

  factory Poster.fromJson(Map<String, dynamic> json) {
    return Poster(url: json['url'], rawBase64File: json['raw_base64_file']);
  }
}
