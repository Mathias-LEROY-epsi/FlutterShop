import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'cart_model.dart';
import 'cart_page.dart';
import 'details_page.dart';
import 'list_product_page.dart';
import 'product_model.dart';

void main() {
  runApp(ChangeNotifierProvider<CartModel>(
    create: (context) => CartModel(),
    child: MyShop(),
  ));
}

class MyShop extends StatelessWidget {
  MyShop({Key? key}) : super(key: key);
  final _router = GoRouter(routes: [
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const ListProductPage();
        },
        routes: [
          GoRoute(
            path: 'cart',
            builder: (BuildContext context, GoRouterState state) {
              return const CartPage();
            },
          ),
          GoRoute(
            path: 'details',
            builder: (BuildContext context, GoRouterState state) {
              return DetailsPage(state.extra as Product);
            },
          ),
        ]),
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "My App",
      theme: ThemeData(primaryColor: Colors.amber),
      routerConfig: _router,
    );
  }
}
