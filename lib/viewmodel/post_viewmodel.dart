import 'package:get/get.dart';
import 'package:rest_api/repostitory/post_repository.dart';

class PostViewModel extends GetxController{
  ApiHelper apiHelper = ApiHelper();
  final postList = [].obs;
  RxBool isLoading = false.obs;

  Future<void> getAllPost() async{
    isLoading.value = true;
    postList.value = await apiHelper.fetchAllPosts();
    isLoading.value = false;
  }
}