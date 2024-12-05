import 'package:either_dart/either.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/failure/failure.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/home/domain/entities/notice.dart';

abstract class BaseHomeNoticeRepository {
  Future <Either<Failure,List<NoticeEntity>>> getNotices();
}


