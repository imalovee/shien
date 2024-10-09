import 'package:flutter/foundation.dart';

class ItemModel {
 final int id;
 final String title;
 final String description;
 final double price;
 final String category;
 final String image;
 final double rate;
 final int rateCount;

//class constructor
  ItemModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.image,
    required this.rate,
    required this.rateCount
  });
// Factory constructor to get data from the api (JSON)
  factory ItemModel.fromJson(Map<String, dynamic> data)=> ItemModel(
      id: data['id'] ?? 0 ,
      title: data['title'] ?? "",
      description: data['description'] ?? "" ,
      price: double.parse(data['price'].toString()) ,
      category: data['category'] ?? "" ,
      image: data['image'] ?? "" ,
      rate: double.parse(data['rating']['rate'].toString()),
      rateCount: data['rating']['rateCount'] ?? 0 ,
  );
// Method to convert the object to a map (JSON)
  Map<String, dynamic> toJson(){
    return{

      title: 'title',
      description:'description'
      //and others
    };
  }
}