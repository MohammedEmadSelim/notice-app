import 'package:factory_method_pattern_with_clean_architecture/features/auth/data/data_source/auth_data_source.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/auth/data/repository/auth_repository.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/auth/domian/use_cases/check_usero_id_exsist.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/auth/domian/use_cases/create_user_id_use_case.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/data/data_source/create_notice_data_source.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/data/repository/create_notice_repository.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/domain/use_cases/create_notice_use_case.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/edit_notice/data/data_source/create_notice_data_source.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/edit_notice/data/repository/edit_notice_repository.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/edit_notice/domain/use_cases/edit_notice_use_case.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/home/data/data_source/home_data_source.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/home/data/repository/home_repository.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/home/domain/use_cases/get_notice_use_case.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> init()async{


  sl.registerLazySingleton<CreateNoticeRemoteDataSource>(() => CreateNoticeRemoteDataSource());
  sl.registerLazySingleton<CreateNoticeRepository>(() => CreateNoticeRepository(sl.get<CreateNoticeRemoteDataSource>()));
  sl.registerLazySingleton<CreateNoticeUseCase>(() => CreateNoticeUseCase(sl.get<CreateNoticeRepository>()));


  sl.registerLazySingleton<HomeNoticeRemoteDataSource>(() => HomeNoticeRemoteDataSource());
  sl.registerLazySingleton<HomeNoticeRepository>(() => HomeNoticeRepository(sl.get<HomeNoticeRemoteDataSource>()));
  sl.registerLazySingleton<GetNoticeUseCase>(() => GetNoticeUseCase(sl.get<HomeNoticeRepository>()));


  sl.registerLazySingleton<EditNoticeRemoteDataSource>(() => EditNoticeRemoteDataSource());
  sl.registerLazySingleton<EditNoticeRepository>(() => EditNoticeRepository(sl.get<EditNoticeRemoteDataSource>()));
  sl.registerLazySingleton<EditNoticeUseCase>(() => EditNoticeUseCase(sl.get<EditNoticeRepository>()));


  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSource());
  sl.registerLazySingleton<AuthRepository>(() => AuthRepository(sl.get<AuthRemoteDataSource>()));
  sl.registerLazySingleton<CreateUserIdUseCase>(() => CreateUserIdUseCase(sl.get<AuthRepository>()));



  sl.registerLazySingleton<CheckUserIdExist>(() => CheckUserIdExist(sl.get<AuthRepository>()));



}