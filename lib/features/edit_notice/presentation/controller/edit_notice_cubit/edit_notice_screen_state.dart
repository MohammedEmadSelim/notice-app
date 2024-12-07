part of 'edit_notice_screen_cubit.dart';

@immutable
sealed class EditNoticeScreenState {}

final class EditNoticeScreenInitial extends EditNoticeScreenState {}


final class EditNoticeScreenLoading extends EditNoticeScreenState {}
final class EditNoticeScreenSuccess extends EditNoticeScreenState {}
final class EditNoticeScreenFailure extends EditNoticeScreenState {}

