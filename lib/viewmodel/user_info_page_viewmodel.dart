import 'package:get/get.dart';
import 'package:rest_api/model/user_info_model.dart';
import 'package:rest_api/repostitory/user_info_repository.dart';

class UserInfoViewModel extends GetxController{
  final userInfoList = <UserInfoModel>[].obs;
  RxBool isLoading = false.obs;

  Future<void> getUserInfo() async{
    isLoading.value = true;
    userInfoList.value = await ApiServices.fetchUserList();
    isLoading.value = false;
  }

  @override
  void onInit() {
    //getUserInfo();
    super.onInit();
  }
}