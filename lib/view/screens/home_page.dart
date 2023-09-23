import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api/view/screens/post_page.dart';
import 'package:rest_api/view/screens/user_info_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              color: Colors.amber,
              buttonText: 'User Info - with model using http',
              onPressed: (){
                Get.to(()=> const UserInfoPage());
              },
            ),
            SizedBox(height: Get.height*0.02,),
            CustomButton(
              color: Colors.deepOrange,
              buttonText: 'Posts - without model using dio',
              onPressed: (){
                Get.to(()=> const UserPostPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.buttonText,
    this.color,
    this.onPressed
  });

  final VoidCallback? onPressed;
  final String? buttonText;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: Get.height*0.06,
      minWidth: Get.width*0.7,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: Text('$buttonText'),
    );
  }
}
