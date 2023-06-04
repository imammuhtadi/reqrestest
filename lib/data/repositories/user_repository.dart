import 'package:dio/dio.dart';
import 'package:netwerktest/data/models/user/all_user_response.dart';

class UserRepository {
  final dio = Dio();

  Future<dynamic> getUser({required int page}) async {
    try {
      final response = await dio.get(
        'https://reqres.in/api/users?page=$page',
        options: Options(
          headers: {Headers.contentTypeHeader: 'application/json'},
        ),
      );
      return AllUserResponse.fromJson(response.data);
    } catch (e) {
      if (e is DioError) {
        return e.message;
      } else {
        return 'Something went wrong';
      }
    }
  }
}
