// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:grocerybloc/features/home/models/home_product_model.dart';

import '../bloc/home_bloc.dart';

class productTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
   productTileWidget({
    Key? key,
    required this.productDataModel, required Type homeBloc,
  }) : super(key: key);
 
  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(productDataModel.imageUrl), fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(productDataModel.name,style: TextStyle(
            fontSize: 18,fontWeight: FontWeight.bold,
          ),),
           SizedBox(
            height: 20,
          ),
          Text(productDataModel.description,style: TextStyle(
            fontSize: 18,fontWeight: FontWeight.bold,
          ),),
          
          Row(
            children: [
             Text('\$ '+productDataModel.price.toString(),style: TextStyle(
            fontSize: 18,fontWeight: FontWeight.bold,
          ),),
          SizedBox(width:220),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    homeBloc.add( HomeProductWishListButtonClickedEvent(
                      clickedProducts: productDataModel
                    ));
                  },
                  icon: Icon(Icons.favorite_border)),
              IconButton(
                  onPressed: () {
                    homeBloc.add( HomeProductCartButtonClickedEvent(clickedProducts:productDataModel));
                  },
                  icon: Icon(Icons.shopping_bag_outlined)),
            ],
          )
            ],
          )

        ],
      ),
    );
  }
}
