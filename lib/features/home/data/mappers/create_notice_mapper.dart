import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/data/models/create_notice_model.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/domain/entities/create_notice_entity.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/home/data/models/notice_model.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/home/domain/entities/notice_entity.dart';

class GetNoticeMapper {
  static NoticeEntity mapToNoticeEntity(NoticeModel notice) =>
      NoticeEntity(notice.id,notice.title, notice.description, notice.createdAt);
}
