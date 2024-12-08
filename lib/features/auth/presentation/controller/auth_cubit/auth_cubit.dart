import 'package:bloc/bloc.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/service_locator/service_locators.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/cache_helper.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/constants/cashe_strings.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/auth/domian/entities/create_user_id_param.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/auth/domian/use_cases/check_usero_id_exsist.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/auth/domian/use_cases/create_user_id_use_case.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final CreateUserIdUseCase createUserIdUseCase = sl.get<CreateUserIdUseCase>();
  final CheckUserIdExist checkUserIdExistUseCase = sl.get<CheckUserIdExist>();

  Future<void> createUserId(CreateUserIdParam userId) async {
    emit(AuthCreateUserIdLoading());
    var response = await createUserIdUseCase.call(userId);
    response.fold(
      (failure) {
        emit(AuthCreateUserIdFailure(failure.error));
      },
      (right) async{
         await CacheHelper.saveData(key: CacheStrings.userID, value: userId.userId);
        emit(AuthCreateUserIdSuccess());
      },
    );
  }

  Future<void> checkUserIdExist(CreateUserIdParam userId) async {
    emit(AuthUserIdExistLoading());
    var response = await checkUserIdExistUseCase.call(userId);
    response.fold(
      (failure) {
        print(failure.error);
        emit(AuthUserIdExistFailure(failure.error));
      },
      (right) {
        emit(AuthUserIdExistSuccess());
      },
    );
  }
}
