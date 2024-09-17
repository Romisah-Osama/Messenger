import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://reqres.in/api'));

  Future<Response?> login(String email, String password) async {
    try {
      Response response = await _dio.post(
        '/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      return response;
    } on DioError catch (e) {
      print('Login failed: ${e.response?.data}');
      return e.response;
    }
  }

  Future<Response?> register(String email, String password) async {
    try {
      Response response = await _dio.post(
        '/register',
        data: {
          'email': email,
          'password': password,
        },
      );
      return response;
    } on DioError catch (e) {
      print('Registration failed: ${e.response?.data}');
      return e.response;
    }
  }
}