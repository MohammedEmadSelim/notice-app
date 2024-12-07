import 'package:either_dart/src/either.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/failure/failure.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/use_case.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/home/domain/entities/notice_entity.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/home/domain/repository/base_home_repository.dart';

class GetNoticeUseCase extends UseCase<List<NoticeEntity>>{
  final BaseHomeNoticeRepository baseHomeNoticeRepository;

  GetNoticeUseCase(this.baseHomeNoticeRepository);

  @override
  Future<Either<Failure, List<NoticeEntity>>> call() {
    return baseHomeNoticeRepository.getNotices();
  }
  
}