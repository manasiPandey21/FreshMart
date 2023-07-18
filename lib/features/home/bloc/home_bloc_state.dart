// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState {}

class HomeInitial extends HomeState {}

class HomeloadingState extends HomeState {}

class HomeloadedSuccessState extends HomeState {
  final List<ProductDataModel> products;
  HomeloadedSuccessState({
    required this.products,
  });
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishListActionState extends HomeActionState {}

class HomeNavigateToCartActionState extends HomeActionState {}
class HomeProductItemsWishlistedState extends HomeActionState{}
class HomeProductItemsCartedState extends HomeActionState{}
