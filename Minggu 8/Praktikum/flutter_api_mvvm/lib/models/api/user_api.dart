import 'package:dio/dio.dart';
import 'package:flutter_api_mvvm/models/user_models.dart';

class UserApi {
  Future<Map<String, dynamic>> updateuser({required UserModels userModels}) async {
    final response = await Dio().put(
      "https://jsonplaceholder.typicode.com/posts/1",
      data: {
        "title" : userModels.title,
        "body" : userModels.body,
      },
    );
    return response.data;
  }
}
