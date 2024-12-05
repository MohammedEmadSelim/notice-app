import 'package:either_dart/src/either.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/failure/failure.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/use_case.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/domain/entities/create_notice_entity.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/domain/entities/notice.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/domain/repository/base_create_notice_repository.dart';

class CreateNoticeUseCase extends UseCaseWithParam<CreateNoticeEntity,Notice>{
  final BaseCreateNoticeRepository baseCreateNoticeRepository;

  CreateNoticeUseCase(this.baseCreateNoticeRepository);

  @override
  Future<Either<Failure, CreateNoticeEntity>> call(Notice notice) {
    return baseCreateNoticeRepository.createNotice(notice);
  }
  
}