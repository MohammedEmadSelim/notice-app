import 'package:bloc/bloc.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/service_locator/service_locators.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/domain/entities/notice_request.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/edit_notice/domain/entities/update_notice.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/edit_notice/domain/use_cases/edit_notice_use_case.dart';
import 'package:meta/meta.dart';

part 'edit_notice_screen_state.dart';

class EditNoticeScreenCubit extends Cubit<EditNoticeScreenState> {
  EditNoticeScreenCubit() : super(EditNoticeScreenInitial());
final EditNoticeUseCase editNoticeUseCase = sl.get<EditNoticeUseCase>();
  Future <void> updateNotice(UpdateNotice notice)async{
    emit(EditNoticeScreenLoading());
    var response = await editNoticeUseCase.call(notice);
    response.fold((left) {
      print(left.error);
      emit(EditNoticeScreenFailure());
    }, (right) {
      emit(EditNoticeScreenSuccess());
    },);
  }
}
