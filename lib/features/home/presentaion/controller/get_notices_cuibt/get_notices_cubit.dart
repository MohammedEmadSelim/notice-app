import 'package:bloc/bloc.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/service_locator/service_locators.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/home/domain/entities/notice_entity.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/home/domain/use_cases/get_notice_use_case.dart';
import 'package:meta/meta.dart';

part 'get_notices_state.dart';

class GetNoticesCubit extends Cubit<GetNoticesState> {
  GetNoticesCubit() : super(GetNoticesInitial());
  final GetNoticeUseCase getNoticeUseCase = sl.get<GetNoticeUseCase>();

  Future<void> getNotices() async {
    emit(GetNoticesLoading());
    var response = await getNoticeUseCase.call();

    response.fold(
      (failure) {
        emit(GetNoticesFailure(failure.error));
      },
      (notices) {
        emit(GetNoticesSuccess(notices));
      },
    );
  }
}
