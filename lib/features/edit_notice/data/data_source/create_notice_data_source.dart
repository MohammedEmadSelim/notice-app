import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/cache_helper.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/constants/cashe_strings.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/failure/failure.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/data/mappers/create_notice_mapper.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/data/models/create_notice_model.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/domain/entities/create_notice_entity.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/domain/entities/notice_request.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/edit_notice/data/mappers/update_notice_mapper.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/edit_notice/data/models/edit_notice_model.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/edit_notice/domain/entities/edit_notice_entity.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/edit_notice/domain/entities/update_notice.dart';

abstract class EditNoticeDataSource {
  Future<UpdateNoticeEntity> EditNotice(UpdateNotice notice);
}

class EditNoticeRemoteDataSource extends EditNoticeDataSource {
  @override
  Future<UpdateNoticeEntity> EditNotice(UpdateNotice notice) async {
    // Update document to the 'users' collection
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    final String collection = CacheHelper.getData(CacheStrings.userID);
    try {
      await fireStore
          .collection(collection)
          .doc(notice.id)
          .update(notice.toJson());

      return UpdateNoticeMapper.mapToUpdateNoticeEntity(
          UpdateNoticeModel('"User added successfully")'));
    } catch (e) {
      rethrow;
    }
  }
}
