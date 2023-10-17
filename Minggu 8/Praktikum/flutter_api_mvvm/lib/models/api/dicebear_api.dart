import 'package:dio/dio.dart';

class DicebearApi {
  Future<String> getDiceBear({
    required String nameImage,
  }) async {
    try {
      final response = await Dio().get('https://api.dicebear.com/7.x/pixel-art/svg?seed=$nameImage');

      return response.data.toString();
    } catch (e) {
      throw Exception(e);
    }
  }
}
