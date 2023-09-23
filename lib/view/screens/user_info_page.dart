import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api/viewmodel/user_info_page_viewmodel.dart';
class UserInfoPage extends StatefulWidget {
  const UserInfoPage({super.key});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  final controller = Get.put(UserInfoViewModel());

  @override
  void initState() {
    controller.getUserInfo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users Info"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
            itemCount: controller.userInfoList.length,
            itemBuilder: (context, index) {
              var userInfo = controller.userInfoList[index];
              return ListTile(
                leading: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.deepOrange,
                  child: Text(userInfo.id.toString()),
                ),
                title: Text(userInfo.name.toString(),style: const TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text("Email: ${userInfo.email.toString()}\nUserName: ${userInfo.username.toString()}"),

              );
            },
          );
          }
        }),
      ),
    );
  }
}
