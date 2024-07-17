import 'package:firebase_auth/firebase_auth.dart';

class Trailer {
  String id;
  String title;
  String video;

  Trailer({
    required this.id,
    required this.title,
    required this.video,
  });

  factory Trailer.fromJson(Map<String, dynamic> json) {
    return Trailer(
      id: json['_id'] ?? 'Unknown',
      title: json['title'] ?? 'Unknown',
      video: json['video'] ?? 'Unknown',
    );
  }




}
