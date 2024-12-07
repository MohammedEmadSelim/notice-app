import 'package:bloc/bloc.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/service_locator/service_locators.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/home/domain/entities/notice_entity.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/home/domain/use_cases/get_notice_use_case.dart';
import 'package:meta/meta.dart';

part 'get_notices_state.dart';

class GetNoticesCubit extends Cubit<GetNoticesState> {
  GetNoticesCubit() : super(GetNoticesInitial());
  final GetNoticeUseCase getNoticeUseCase = sl.get<GetNoticeUseCase>();
  List<DateTime> uniqueDates = [];
  Future<void> getNotices() async {
    emit(GetNoticesLoading());
    var response = await getNoticeUseCase.call();

    response.fold(
      (failure) {
        emit(GetNoticesFailure(failure.error));
      },
      (notices) {
        final List<NoticeEntity> today = notices
            .where(
              (element) => element.createDate.month == DateTime.now().month,
            )
            .toList();

        for (int i = 0; i < notices.length; i++) {
          if (!uniqueDates.contains(DateTime(
              notices[i].createDate.year, notices[i].createDate.month)))
            {
              uniqueDates.add(DateTime(
                  notices[i].createDate.year, notices[i].createDate.month));
            }

        }
        print(uniqueDates);
        emit(GetNoticesSuccess(notices:notices,uniqueDates: uniqueDates));
      },
    );
  }
}
// List  d =[2024-12-06 04:48:34.977999, 2024-12-07 02:02:35.618, 2024-12-07 01:53:23.624, 2024-12-07 00:50:35.907, 2024-12-07 00:57:49.775, 2024-12-07 02:01:29.434, 2024-12-07 00:57:16.792]
