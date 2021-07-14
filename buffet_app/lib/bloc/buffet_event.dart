part of 'buffet_bloc.dart';

@immutable
abstract class BuffetEvent {}

class GetBuffetEvent extends BuffetEvent {
  GetBuffetEvent();
}

class PostPinEvent extends BuffetEvent{
  final String pin;
  final String payment;
  PostPinEvent(this.pin, this.payment);
}

