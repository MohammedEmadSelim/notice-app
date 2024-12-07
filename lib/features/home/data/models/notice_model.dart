import 'package:cloud_firestore/cloud_firestore.dart';

class NoticeModel {
  final String id;
  final String title;
  final String description;
  final DateTime createdAt;

  NoticeModel(
      {required this.title,
      required this.description,
      required this.createdAt,
      required this.id});

  factory NoticeModel.fromFireBase(dynamic doc) {
    Map<String, dynamic> json = doc.data();
    return NoticeModel(
      id: doc.id,
      title: json["title"],
      description: json["description"],
      createdAt: (json["createdDate"] as Timestamp).toDate(),
    );
  }
}
