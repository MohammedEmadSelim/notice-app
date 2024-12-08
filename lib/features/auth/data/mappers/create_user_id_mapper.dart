import 'package:factory_method_pattern_with_clean_architecture/features/auth/data/models/create_user_id_mode.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/auth/domian/entities/user_id_entity.dart';

class CreateUserIdMapper{
  static UserIdEntity mapToCreateUSerIdEntity(UserIdModel createUserModel)=>UserIdEntity();
}