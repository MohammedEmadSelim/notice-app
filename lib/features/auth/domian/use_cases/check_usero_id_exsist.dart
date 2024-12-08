import 'package:either_dart/src/either.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/failure/failure.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/use_case.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/auth/domian/entities/create_user_id_param.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/auth/domian/entities/user_id_entity.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/auth/domian/repository/base_auth_repository.dart';

class CheckUserIdExist
    extends UseCaseWithParam<UserIdEntity, CreateUserIdParam> {
  final BaseAuthRepository baseAuthRepository;

  CheckUserIdExist(this.baseAuthRepository);

  @override
  Future<Either<Failure, UserIdEntity>> call(CreateUserIdParam paramEntity) {
    return baseAuthRepository.checkUserIdExist(paramEntity);
  }
}
