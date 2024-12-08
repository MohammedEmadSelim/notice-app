
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/cache_helper.dart';
import 'package:factory_method_pattern_with_clean_architecture/core/utilts/constants/cashe_strings.dart';

class UserState{
  static bool isSignUp (){
    if(CacheHelper.getData(CacheStrings.userID)!=null){
      return true;
    }
    return false;
  }
}