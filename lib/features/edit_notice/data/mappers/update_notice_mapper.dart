import 'package:factory_method_pattern_with_clean_architecture/features/edit_notice/data/models/edit_notice_model.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/edit_notice/domain/entities/edit_notice_entity.dart';

class UpdateNoticeMapper{
  static UpdateNoticeEntity mapToUpdateNoticeEntity(UpdateNoticeModel notice)=>UpdateNoticeEntity(notice.message);
}