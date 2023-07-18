// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc_bloc.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

 class CartActionState extends CartState {}

class CartSuccessState extends CartState {
  final List<ProductDataModel> cartItems;
  CartSuccessState({
    required this.cartItems,
  });
}
