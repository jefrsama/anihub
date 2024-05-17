import 'dart:ffi';

import 'quality.dart';

import 'episodes.dart';

class Torrent {
  int? torrentId;
  Episodes? episodes;
  Quality? quality;
  int? leechers;
  int? seeders;
  int? downloads;
  int? totalSize;
  String? sizeString;
  String? url;
  String? magnet;
  int? uploadedTimestamp;
  String? hash;
  String? rawBase64File;

  Torrent({
    required this.torrentId,
    required this.episodes,
    required this.quality,
    required this.leechers,
    required this.seeders,
    required this.downloads,
    required this.totalSize,
    required this.sizeString,
    required this.url,
    required this.magnet,
    required this.uploadedTimestamp,
    required this.hash,
    required this.rawBase64File,
  });

  factory Torrent.fromJson(Map<String, dynamic> json) {
    return Torrent(
      torrentId: json['torrent_id'],
      episodes: Episodes.fromJson(json['episodes']),
      quality: Quality.fromJson(json['quality']),
      leechers: json['leechers'],
      seeders: json['seeders'],
      downloads: json['downloads'],
      totalSize: json['total_size'],
      sizeString: json['size_string'],
      url: json['url'],
      magnet: json['magnet'],
      uploadedTimestamp: json['uploaded_timestamp'],
      hash: json['hash'],
      rawBase64File: json['raw_base64_file']
    );
  }
}
