import 'package:cloud_firestore/cloud_firestore.dart';

class NoticeModel {
  final String title;
  final String description;
  final DateTime createdAt;

  NoticeModel(this.title, this.description, this.createdAt);

  factory NoticeModel.fromJson(Map<String, dynamic> json) {
    print(json["createdDate"]);
    return NoticeModel(
      json["title"],
      json["description"],
      (json["createdDate"] as Timestamp).toDate(),
    );
  }
}
