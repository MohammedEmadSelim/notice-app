part of 'get_notices_cubit.dart';

@immutable
sealed class GetNoticesState {}

final class GetNoticesInitial extends GetNoticesState {}

final class GetNoticesLoading extends GetNoticesState {}

final class GetNoticesSuccess extends GetNoticesState {
  final List<NoticeEntity> notices;
  final List<DateTime> uniqueDates;

  GetNoticesSuccess({required this.notices, required this.uniqueDates});
}

final class GetNoticesFailure extends GetNoticesState {
  final String message;

  GetNoticesFailure(this.message);
}
