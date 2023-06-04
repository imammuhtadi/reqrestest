import 'package:dio/dio.dart';
import 'package:netwerktest/data/models/auth/login_response.dart';

class AuthRepository {
  final dio = Dio();

  Future<dynamic> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        'https://reqres.in/api/login',
        data: {"email": email, "password": password},
        options: Options(
          headers: {Headers.contentTypeHeader: 'application/json'},
        ),
      );
      return LoginResponse.fromJson(response.data);
    } catch (e) {
      if (e is DioError) {
        return e.message;
      } else {
        return 'Something went wrong';
      }
    }
  }
}
