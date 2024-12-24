import 'package:either_dart/src/either.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/failure/failure.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/data/data_source/create_notice_data_source.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/domain/entities/create_notice_entity.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/domain/entities/notice_request.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/domain/repository/base_create_notice_repository.dart';
import 'package:firebase_core/firebase_core.dart';

class CreateNoticeRepository extends BaseCreateNoticeRepository{
  final CreateNoticeDataSource createNoticeDataSource;

  CreateNoticeRepository(this.createNoticeDataSource);

  @override
  Future<Either<Failure, CreateNoticeEntity>> createNotice(Notice notice) async{
    try {
      var response = await createNoticeDataSource.createNotice(notice);
      return Right(response);
    }on FirebaseException  catch(e){
      return Left(FirebaseFailure(error: e.code));
    }
  }

}