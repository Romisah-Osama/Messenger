import 'package:dio/dio.dart';
import 'package:my_app/messenger/products.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ApiProvider {
  Products? productsModel; // Changed to 'Products'
  static const String baseUrl = "https://dummyjson.com";
  String? token;

  Future<Products?> getProducts() async {
    try {
      Response response = await Dio().get(
        "$baseUrl/products",
        queryParameters: {
          "select": "id,title,description,category,price,thumbnail"
        },
      );

      productsModel = Products.fromJson(response.data); // Updated to match Products class
      print(productsModel!.products![0].title); // Accessing product data
      return productsModel;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<String> userLogin({required String userName, required String userPassword}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    FormData userData = FormData.fromMap({
      'username': userName,
      'password': userPassword,
    });

    try {
      Response userLoginResponse = await Dio().post(
        "https://dummyjson.com/auth/login",
        data: userData,
      );

      print(userLoginResponse.data);
      print(userLoginResponse.statusCode);
      print(userLoginResponse.data["token"]);
      await prefs.setString("userToken", userLoginResponse.data["token"]);
      return "Login Success";
    } catch (e) {
      if (e is DioError) {
        print(e.response!.data);
        print(e.response!.statusCode);
        return e.response!.data['message'];
      }
      return 'An unexpected error occurred';
    }
  }
}