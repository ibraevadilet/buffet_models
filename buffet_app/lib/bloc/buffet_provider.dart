import 'package:buffet_app/helpers/api_requester.dart';
import 'package:buffet_app/helpers/buffet_exception.dart';
import 'package:buffet_app/model/buffet_model.dart';
import 'package:dio/dio.dart';

class BuffetProvider {
  Future<List<BuffetModels>> getBuffet() async {
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.toGet("product/all");
      if (response.statusCode == 200) {
        response.data.map((val) => print(val));
        return response.data.map<BuffetModels>((val) => BuffetModels.fromJson(val)).toList();
      }
      throw BuffetExceptions.catchError(response);
    } catch (e) {
      print(e);
      throw BuffetExceptions.catchError(e);
    }
  }
}

class BuffetProvider2 {
  Future<BuffetPin> postBuffet(String pin, String payment) async {
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester
          .toPost("pin/make/payment", 
          param: {'payment': payment, 'pin': pin});
      if (response.statusCode == 200) {
        return BuffetPin.fromJson(response.data);
      }
      // https://app.megacom.kg:9090/test-app/api/v1/pin/make/payment?payment=130&pin=66666
      throw BuffetExceptions.catchError(response);
    } catch (e) {
      // print(e);
      throw BuffetExceptions.catchError(e);
    }
  }
}

// class BuffetProvider2 {
//   Future<BuffetModels2> getBuffet() async {
//     try {
//       ApiRequester2 requester = ApiRequester2();
//       Response response = await requester.toGet();
//       if (response.statusCode == 200) {
//         return BuffetModels.fromJson(response.data);
//       }
//       throw BuffetExceptions.catchError(response);
//     } catch (e) {
//       throw BuffetExceptions.catchError(e);
//     }
//   }
// }
