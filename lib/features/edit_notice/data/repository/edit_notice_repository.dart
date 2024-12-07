import 'package:either_dart/src/either.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/failure/failure.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/data/data_source/create_notice_data_source.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/edit_notice/data/data_source/create_notice_data_source.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/edit_notice/domain/entities/edit_notice_entity.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/edit_notice/domain/entities/update_notice.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/edit_notice/domain/repository/base_edit_notice_repository.dart';
import 'package:firebase_core/firebase_core.dart';

class EditNoticeRepository extends BaseEditNoticeRepository{
  final EditNoticeDataSource editNoticeDataSource;

  EditNoticeRepository(this.editNoticeDataSource);

  @override
  Future<Either<Failure, UpdateNoticeEntity>> editNotice(UpdateNotice notice) async{
    try {
      var response = await editNoticeDataSource.EditNotice(notice);
      return Right(response);
    }on FirebaseException  catch(e){
      return Left(FirebaseFailure(error: e.code));
    }
  }

}