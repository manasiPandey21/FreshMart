part of 'cart_bloc_bloc.dart';

@immutable
abstract class CartEvent {}
abstract class CartInitialEvent extends CartEvent{}
abstract class CartRemoveFromCartEvent extends CartEvent{
  
}
