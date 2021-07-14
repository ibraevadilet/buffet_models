import 'package:buffet_app/bloc/buffet_provider.dart';
import 'package:buffet_app/model/buffet_model.dart';

class BuffetRepository {
  Future<List<BuffetModels>> getBuffet() {
    BuffetProvider provider = BuffetProvider();
    return provider.getBuffet();    
  }

  Future<BuffetPin> postBuffet(String payment, String pin){
    BuffetProvider2 provider = BuffetProvider2();
    return provider.postBuffet(payment, pin);
  }
}


// class BuffetRepository2{
//     Future<BuffetModels2> getBuffet() {
//     BuffetProvider2 provider = BuffetProvider2();
//     return provider.getBuffet();
//   }
// }
