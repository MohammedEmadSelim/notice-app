part of 'create_notice_cubit.dart';

@immutable
sealed class CreateNoticeState {}

final class CreateNoticeInitial extends CreateNoticeState {}


final class CreateNoticeLoading extends CreateNoticeState {}
final class CreateNoticeSuccess extends CreateNoticeState {}
final class CreateNoticeFailure extends CreateNoticeState {}
