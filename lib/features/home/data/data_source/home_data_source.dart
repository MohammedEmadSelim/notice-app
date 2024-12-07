import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/failure/failure.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/data/mappers/create_notice_mapper.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/data/models/create_notice_model.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/domain/entities/create_notice_entity.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/create_notice/domain/entities/notice.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/home/data/models/notice_model.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/home/domain/entities/notice_entity.dart';

abstract class HomeNoticeDataSource {
  Future<List<NoticeModel>> getNotice();
}

class HomeNoticeRemoteDataSource extends HomeNoticeDataSource {
  @override
  Future<List<NoticeModel>>getNotice() async {
    // Add a new document to the 'users' collection
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    try {
      var response = await fireStore.collection('users').get();
      var docs = response.docs;
      var data = docs.map(
        (e) => NoticeModel.fromFireBase(e),
      ).toList();

      return data;
    } catch (e) {
      rethrow;
    }
  }
}
