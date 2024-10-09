import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shien/model.dart';
import 'package:http/http.dart' as http;
import 'package:shien/product_tile.dart';

class HomeScreenController extends GetxController{
  var products = <ItemModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit(){
    super.onInit();
  fetchProducts();
  }

  Future<void> fetchProducts()async{
    print('fetching products');
    try{
      final url = Uri.parse('https://fakestoreapi.com/products');
      final response = await http.get(url);
      isLoading.toggle();

      if(response.statusCode >= 200 && response.statusCode < 300){
        final List<dynamic>body = jsonDecode(response.body);
        for(var product in body){
          products.add(ItemModel.fromJson(product));
        }
      }
    }
    catch(e){
      log('An error occurred ${e.toString()}');
    }
  }
}

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
    final controller = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    return Obx((){
      final screenState = controller.isLoading.value;
      final products = controller.products;
      return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(16),
              child: screenState? showLoading()
                  : MasonryGridView.count(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ProductTile(product: products[index]);
                  },
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 12,
              )
            )
        ),
      );
    });
  }
  Widget showLoading(){
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
