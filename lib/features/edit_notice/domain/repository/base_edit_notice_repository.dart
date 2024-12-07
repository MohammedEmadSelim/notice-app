import 'package:either_dart/either.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/failure/failure.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/domain/entities/create_notice_entity.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/edit_notice/domain/entities/edit_notice_entity.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/edit_notice/domain/entities/update_notice.dart';

abstract class BaseEditNoticeRepository {
  Future <Either<Failure,UpdateNoticeEntity>> editNotice(UpdateNotice notice);
}



