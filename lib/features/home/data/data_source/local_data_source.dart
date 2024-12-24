import 'package:factory_method_pattern_with_clean_architecture/core/utilts/hive/boxes.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/home/data/models/notice_model.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/home/domain/entities/notice_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalNoticeDataSource {
 List<NoticeEntity> getNotice();
}


class HomeLocalNoticeDataSourceImpl extends HomeLocalNoticeDataSource{
  @override
  List<NoticeEntity> getNotice() {
  return boxNotices.values.toList();
  }

}