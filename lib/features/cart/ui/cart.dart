import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocerybloc/features/cart/ui/bloc/cart_bloc_bloc.dart';

import 'cart_tile_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartBloc cartBloc = CartBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart Items"),
        ),
        body: BlocConsumer<CartBloc, CartState>(
            listenWhen: (previous, current) => current is CartActionState,
            buildWhen: (previous, current) => current is! CartActionState,
            listener: (context, state) {},
            builder: (context, state) {
              switch (state.runtimeType) {
                case CartSuccessState:
                  final successState = state as CartSuccessState;
                  return ListView.builder(
                      itemCount: successState.cartItems.length,
                      itemBuilder: (context, index) {
                        return CartTileWidget(
                          cartBloc: CartBloc,
                          productDataModel: successState.cartItems[index],
                        );
                      });
              }
              ;

              return Container();
            }));
  }
}
