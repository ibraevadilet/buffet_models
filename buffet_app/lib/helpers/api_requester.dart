import 'package:dio/dio.dart';

import 'buffet_exception.dart';

class ApiRequester {
  static String url = "https://app.megacom.kg:9090/test-app/api/v1/";

  Future<Dio> initDio() async {
    return Dio(BaseOptions(
      baseUrl: url,
      responseType: ResponseType.json,
      receiveTimeout: 10000,
      connectTimeout: 10000,
    ));
  }

  Future<Response> toGet(String url) async {
    Dio dio = await initDio();
    try {
      return dio.get(url);
    } catch (e) {
      print(e);
      throw BuffetExceptions.catchError(e);
    }
  }

  Future<Response> toPost(String url, {Map<String, dynamic>? param}) async {
    Dio dio = await initDio();
    try {
      return await dio.post(url, queryParameters: param); //data: dataParam,
    } catch (e) {
      throw BuffetExceptions.catchError(e);
    }
  }
}

// class ApiRequester2 {
//   static String second_url = '';
//     Future<Dio> initDio() async {
//     return Dio(BaseOptions(
//       baseUrl: second_url,
//       responseType: ResponseType.json,
//       receiveTimeout: 10000,
//       connectTimeout: 10000,
//     ));
//   }

//   Future<Response> toGet() async {
//     Dio dio = await initDio();
//     try {
//       return dio.get(second_url);
//     } catch (e) {
//       throw BuffetExceptions.catchError(e);

//     }
//   }
// }
