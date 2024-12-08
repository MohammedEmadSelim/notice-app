import 'package:either_dart/either.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/failure/failure.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/auth/domian/entities/user_id_entity.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/auth/domian/entities/create_user_id_param.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, UserIdEntity>> createUserId(CreateUserIdParam userId);
  Future<Either<Failure, UserIdEntity>> checkUserIdExist(CreateUserIdParam userId);
}
