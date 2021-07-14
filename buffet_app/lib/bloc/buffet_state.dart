part of 'buffet_bloc.dart';

@immutable
abstract class BuffetState {
  get counter => null;
}

//class BuffetInitial extends BuffetState {}
class BuffetLoading extends BuffetState {}

class BuffetLoaded extends BuffetState {
  final List<BuffetModels> model;
  BuffetLoaded(this.model);
     
  
}

class BuffetError extends BuffetState {
  final BuffetExceptions message;
  BuffetError(this.message);
}

class PostPinLoaded extends BuffetState{
  final BuffetPin model_;
  PostPinLoaded(this.model_);
}

// class CounterState extends BuffetState{
//    int? counter;
//   CounterState({this.counter});
// }

// abstract class BuffetState2 {}
// class BuffetDebtsLoaded extends BuffetState2{
//   final BuffetModels2 model;
//   BuffetDebtsLoaded(this.model);
// }
// class BuffetError2 extends BuffetState2 {
//   final BuffetExceptions message;
//   BuffetError2(this.message);
// }


