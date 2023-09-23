import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api/viewmodel/post_viewmodel.dart';
import 'package:rest_api/viewmodel/user_info_page_viewmodel.dart';

class UserPostPage extends StatefulWidget {
  const UserPostPage({super.key});

  @override
  State<UserPostPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserPostPage> {
  final controller = Get.put(PostViewModel());

  @override
  void initState() {
    controller.getAllPost();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("POST"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: Get.width,
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: controller.postList.length,
              itemBuilder: (context, index) {
                var postInfo = controller.postList[index];
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.deepOrange,
                      child: Text(postInfo['id'].toString()),
                    ),
                    const SizedBox(height: 10,),

                    const Divider(height: 3,color: Colors.black,),
                    Row(
                      children: [
                        const Text("Title: ",style: TextStyle(fontWeight: FontWeight.bold),),
                        const SizedBox(width: 10,),
                        Expanded(
                            child: Text(postInfo['title'],style: const TextStyle(fontWeight: FontWeight.bold))
                        ),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(height: 10,),
                    Text(postInfo['body']),
                    const SizedBox(height: 10,),
                    const Divider(height: 3,color: Colors.black,),
                    SizedBox(height: Get.height*0.03,)
                  ],
                );
              },
            );
          }
        }),
      ),
    );
  }
}
