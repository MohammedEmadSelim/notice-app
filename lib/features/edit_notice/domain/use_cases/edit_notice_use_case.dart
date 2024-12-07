import 'package:either_dart/src/either.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/failure/failure.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/use_case.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/edit_notice/domain/entities/edit_notice_entity.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/edit_notice/domain/entities/update_notice.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/edit_notice/domain/repository/base_edit_notice_repository.dart';

class EditNoticeUseCase extends UseCaseWithParam<UpdateNoticeEntity,UpdateNotice>{
  final BaseEditNoticeRepository baseEditeNoticeRepository;

  EditNoticeUseCase(this.baseEditeNoticeRepository);

  @override
  Future<Either<Failure, UpdateNoticeEntity>> call(UpdateNotice notice) {
    return baseEditeNoticeRepository.editNotice(notice);
  }
  
}