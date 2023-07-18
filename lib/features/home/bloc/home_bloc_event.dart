// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
abstract class HomeBlocEvent {}

class HomeInitialEvent extends HomeBlocEvent {}

class HomeProductWishListButtonClickedEvent extends HomeBlocEvent {
  final ProductDataModel clickedProducts;
  HomeProductWishListButtonClickedEvent({
    required this.clickedProducts,
  });
  
}

class HomeProductCartButtonClickedEvent extends HomeBlocEvent {
  final ProductDataModel clickedProducts;
  HomeProductCartButtonClickedEvent({
    required this.clickedProducts,
  });
}

class HomeWishListButtonNavigateEvent extends HomeBlocEvent {}

class HomeCartButtonNavigateEvent extends HomeBlocEvent {}
