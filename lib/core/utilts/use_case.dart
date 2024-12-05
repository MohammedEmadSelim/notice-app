import 'package:either_dart/either.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/failure/failure.dart';

abstract class UseCase<Entity> {
  Future<Either<Failure, Entity>> call();
}

abstract class UseCaseWithParam<Entity, ParamEntity> {
  Future<Either<Failure, Entity>> call(ParamEntity paramEntity);
}
