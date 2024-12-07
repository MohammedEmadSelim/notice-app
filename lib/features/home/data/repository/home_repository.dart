import 'package:either_dart/src/either.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/failure/failure.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/home/data/data_source/home_data_source.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/home/data/mappers/create_notice_mapper.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/home/domain/entities/notice_entity.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/home/domain/repository/base_home_repository.dart';
import 'package:firebase_core/firebase_core.dart';

class HomeNoticeRepository extends BaseHomeNoticeRepository {
  final HomeNoticeDataSource homeNoticeDataSource;

  HomeNoticeRepository(this.homeNoticeDataSource);

  @override
  Future<Either<Failure, List<NoticeEntity>>> getNotices() async {
    try {
      var response = await homeNoticeDataSource.getNotice();
      return Right(response
          .map(
            (e) => GetNoticeMapper.mapToNoticeEntity(e),
          )
          .toList());
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(error: e.code));
    }
  }
}
