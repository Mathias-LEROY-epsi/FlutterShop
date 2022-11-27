import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'cart_model.dart';
import 'product_model.dart';
import 'list_view_products.dart';

class ListProductPage extends StatelessWidget {
  const ListProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des produits"),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    context.go('/cart');
                  },
                  icon: const Icon(Icons.shopping_cart)),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                    width: 18,
                    height: 18,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text("${context.watch<CartModel>().getCount()}",
                            style: const TextStyle(color: Colors.white)))),
              ),
            ],
          )
        ],
      ),
      body: FutureBuilder<http.Response>(
          future: http.get(Uri.parse("https://fakestoreapi.com/products")),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              List<dynamic> lsJsonProducts = jsonDecode(snapshot.data!.body);
              List<Product> lsProducts = lsJsonProducts
                  .map((element) => Product.fromJson(element))
                  .toList();
              return ListViewProducts(listProducts: lsProducts);
            } else if (snapshot.hasError) {
              return const Text("Impossible de récupérer des infos...");
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              return Container();
            }
          }),
    );
  }
}
