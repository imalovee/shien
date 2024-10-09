import 'package:flutter/material.dart';

import 'model.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key, required this.product});
  final ItemModel product;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Image(image: NetworkImage(product.image)),
        Container(
          color: Colors.white,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.title,
                style: const TextStyle(fontWeight: FontWeight.bold),),
              Row(
               // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('Price',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),),
                  const SizedBox(width: 8,),
                  Text('\$${product.price.toString()}',
                    style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
                ],
              ),
              //const SizedBox(height: 6,),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('Rating',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),),
                  const SizedBox(width: 8,),
                  Text(product.rate.toString(),
                    style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
                ],
              ),
              Text(product.description)
            ],
          ),
        )
      ],
    );
  }
}
