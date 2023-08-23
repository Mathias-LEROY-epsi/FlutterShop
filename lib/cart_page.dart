import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartModel lsProducts = context.watch<CartModel>();
    return Scaffold(
      appBar: AppBar(title: const Text("Panier")),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Builder(builder: (context) {
                  if (context.watch<CartModel>().getCount() == 0) {
                    return Text("Votre panier est vide",
                        style: Theme.of(context).textTheme.titleLarge);
                  } else if (context.watch<CartModel>().getCount() == 1) {
                    return Text("Votre panier contient 1 produit",
                        style: Theme.of(context).textTheme.titleLarge);
                  }
                  return Text(
                      "Votre panier contient ${context.watch<CartModel>().getCount()} produits",
                      style: Theme.of(context).textTheme.titleLarge);
                }),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: context.watch<CartModel>().getCount(),
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Image.network(
                        lsProducts.getProduct()[index].image,
                        width: 80,
                        height: 80,
                      ),
                      title: Text(lsProducts.getProduct()[index].title),
                      subtitle: Text(lsProducts.getProduct()[index].category,
                          style: const TextStyle(color: Colors.blue)),
                      trailing: IconButton(
                          onPressed: () {
                            lsProducts.removeProduct(lsProducts.getProduct()[index]);
                          },
                          icon: const Icon(Icons.delete),
                          color: Colors.red),
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                child: Text(
                  "Le prix total est de : ${context.watch<CartModel>().getTotal()} €",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
