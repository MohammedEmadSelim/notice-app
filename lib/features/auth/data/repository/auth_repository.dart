import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/src/either.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/failure/exceptions.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/failure/failure.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/auth/data/data_source/auth_data_source.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/auth/data/mappers/create_user_id_mapper.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/auth/domian/entities/user_id_entity.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/auth/domian/entities/create_user_id_param.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/auth/domian/repository/base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  final BaseAuthDataSource baseAuthDataSource;
  AuthRepository(this.baseAuthDataSource);

  @override
  Future<Either<Failure, UserIdEntity>> createUserId(
      CreateUserIdParam userId) async {
    try {
      final response = await baseAuthDataSource.createUserId(userId);
      return Right(CreateUserIdMapper.mapToCreateUSerIdEntity(response));
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(error: e.code));
    }
  }

  @override
  Future<Either<Failure, UserIdEntity>> checkUserIdExist(
      CreateUserIdParam userId) async {
    try {
      final response = await baseAuthDataSource.checkUserIDExist(userId);
      return Right(CreateUserIdMapper.mapToCreateUSerIdEntity(response));
    } on CustomFireBaseException catch (e) {
      return Left(FirebaseFailure(error: e.message));
    }

  }
}
