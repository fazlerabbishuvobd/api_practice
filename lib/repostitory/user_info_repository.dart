import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rest_api/model/user_info_model.dart';

class ApiServices{
  static Future<List<UserInfoModel>> fetchUserList() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((e) => UserInfoModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load user data');
    }
  }

}