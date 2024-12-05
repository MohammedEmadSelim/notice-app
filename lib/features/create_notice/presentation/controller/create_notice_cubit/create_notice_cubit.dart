import 'package:bloc/bloc.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/service_locator/service_locators.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/domain/entities/notice.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/domain/use_cases/create_notice_use_case.dart';
import 'package:meta/meta.dart';

part 'create_notice_state.dart';

class CreateNoticeCubit extends Cubit<CreateNoticeState> {
  CreateNoticeCubit() : super(CreateNoticeInitial());
  final CreateNoticeUseCase  createNoticeUseCase = sl.get<CreateNoticeUseCase>();
  Future <void> createNotice(Notice notice)async{
    print('CreateNoticeCubit');
    emit(CreateNoticeLoading());
    var response = await createNoticeUseCase.call(notice);
    response.fold((left) {
      print(left.error);
      emit(CreateNoticeFailure());
    }, (right) {
      emit(CreateNoticeSuccess());
    },);
  }
}
