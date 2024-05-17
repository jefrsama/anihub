class Quality {
  String? string;
  String? type;
  String? resolution;
  String? encoder;
  String? lqAudio;

  Quality({
    required this.string,
    required this.type,
    required this.resolution,
    required this.encoder,
    required this.lqAudio,
  });

  factory Quality.fromJson(Map<String, dynamic> json) {
    return Quality(
      string: json['string'], 
      type: json['type'], 
      resolution: json['resolution'], 
      encoder: json['encoder'],
      lqAudio: json['lq_audio']
    );
  }
}