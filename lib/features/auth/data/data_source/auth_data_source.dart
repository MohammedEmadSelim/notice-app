import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/failure/exceptions.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/auth/data/models/create_user_id_mode.dart';
import 'package:factory_method_pattern_with_clean_architecture/features/auth/domian/entities/create_user_id_param.dart';

abstract class BaseAuthDataSource {
  Future<UserIdModel> createUserId(CreateUserIdParam userId);
  Future<UserIdModel> checkUserIDExist(CreateUserIdParam userId);
}

class AuthRemoteDataSource extends BaseAuthDataSource {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  @override
  Future<UserIdModel> createUserId(CreateUserIdParam userId) async {
    try {
       await fireStore
          .collection('userIDs')
          .doc(userId.userId)
          .set({'id': userId.userId});

      return UserIdModel();
    } catch (e) {
      rethrow;
    }
  }


  @override
  Future<UserIdModel> checkUserIDExist(CreateUserIdParam userId) async {
    try {
      var response = await fireStore
          .collection('userIDs')
          .doc(userId.userId).get();
        print(response.data());
      if (response.data() != null) {
        print('FirebaseException');
        throw CustomFireBaseException('this_id_is_exist'.tr());
      }
      print('   return UserIdModel();');
      return UserIdModel();
    } catch (e) {
      rethrow;
    }
  }
}