import 'package:firebase_auth/firebase_auth.dart';

class Attachments {
  String id;
  String pdf;
  String video;
  String description;

  Attachments({
    required this.id,
    required this.pdf,
    required this.video,
    required this.description
  });

  factory Attachments.fromJson(Map<String, dynamic> json) {
    return Attachments(
      id: json['_id'] ?? 'Unknown',
      description: json['title'] ?? 'Unknown',
      video: json['video'] ?? 'Unknown',
      pdf: json['pdf'] ?? 'Unknown'
    );
  }




}
