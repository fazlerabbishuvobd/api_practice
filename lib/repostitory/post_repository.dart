import 'package:dio/dio.dart';
class ApiHelper{
  final dio = Dio();
  Future<List<dynamic>> fetchAllPosts() async{
    final response = await dio.get('https://jsonplaceholder.typicode.com/posts');
    if(response.statusCode == 200)
      {
        List<dynamic> jsonData = response.data;
        return jsonData;
      }
    else{
      throw Exception('Unable to fetch');
    }
  }
}