import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/cache_helper.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/constants/cashe_strings.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/data/mappers/create_notice_mapper.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/data/models/create_notice_model.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/domain/entities/create_notice_entity.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/domain/entities/notice_request.dart';

abstract class CreateNoticeDataSource {
  Future< CreateNoticeEntity> createNotice(Notice notice);
}


class CreateNoticeRemoteDataSource extends CreateNoticeDataSource{
  @override
  Future<CreateNoticeEntity> createNotice(Notice notice) async  {
    // Add a new document to the 'users' collection
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final String collection = CacheHelper.getData(CacheStrings.userID);
    try {
      var response = await firestore.collection(collection).add(notice.toJson());
      print("response: $response");
      return NoticeMapper.mapToCreateNoticeEntity(CreateNoticeModel('"User added successfully")'));
    } catch (e) {
      rethrow;
    }
  }
  
}