import 'package:buffet_app/model/buffet_model.dart';
import 'package:buffet_app/model/buffet_model.dart';

getTotal(List<BuffetModels> cart2){
  dynamic summ = 0;
  // final BuffetModels model = new BuffetModels();
  for(var product in cart2){
    summ += product.price!;
  }
  return summ;
}