import 'package:hive/hive.dart';
part 'notice_entity.g.dart';

@HiveType(typeId: 0)
class NoticeEntity{

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final DateTime createDate;

  NoticeEntity(this.id,this.title, this.description, this.createDate);



}