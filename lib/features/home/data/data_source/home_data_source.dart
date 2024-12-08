import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/cache_helper.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/constants/cashe_strings.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/home/data/models/notice_model.dart';

abstract class HomeNoticeDataSource {
  Future<List<NoticeModel>> getNotice();
}

class HomeNoticeRemoteDataSource extends HomeNoticeDataSource {
  @override
  Future<List<NoticeModel>>getNotice() async {
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    final String collection = CacheHelper.getData(CacheStrings.userID);
    try {
      var response = await fireStore.collection(collection).get();
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
