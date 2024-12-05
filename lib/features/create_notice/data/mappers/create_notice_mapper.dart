import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/data/models/create_notice_model.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/domain/entities/create_notice_entity.dart';

class NoticeMapper{
  static CreateNoticeEntity mapToCreateNoticeEntity(CreateNoticeModel notice)=>CreateNoticeEntity(notice.message);
}