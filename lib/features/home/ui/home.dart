import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocerybloc/features/cart/ui/cart.dart';
import 'package:grocerybloc/features/home/bloc/home_bloc.dart';
import 'package:grocerybloc/features/home/ui/product_tile_widget.dart';
import 'package:grocerybloc/features/wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartPage()));
        } else if (state is HomeNavigateToWishListActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Wishlist()));
        } else if (state is HomeProductItemsWishlistedState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Item added to wishlist")));
        } else if (state is HomeProductItemsCartedState) {
           ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Item added to cart")));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeloadingState:
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          case HomeloadedSuccessState:
            var successState = state as HomeloadedSuccessState;

            return Scaffold(
                appBar: AppBar(
                  title: Center(child: Text("Manasi's Grocery")),
                  backgroundColor: Color.fromARGB(255, 0, 81, 5),
                  actions: [
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeWishListButtonNavigateEvent());
                        },
                        icon: Icon(Icons.favorite_border)),
                    IconButton(
                        onPressed: () {
                          homeBloc.add(HomeCartButtonNavigateEvent());
                        },
                        icon: Icon(Icons.shopping_bag_outlined)),
                  ],
                ),
                body: ListView.builder(
                    itemCount: successState.products.length,
                    itemBuilder: (context, index) {
                      return productTileWidget(
                        homeBloc: HomeBloc,
                        productDataModel: successState.products[index],
                      );
                    }));
          case HomeErrorState:
            return Scaffold(
              body: Text("Error"),
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}
