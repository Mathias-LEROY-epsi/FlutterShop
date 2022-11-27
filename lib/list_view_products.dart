import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'product_model.dart';
import 'cart_model.dart';

class ListViewProducts extends StatelessWidget {
  final List<Product> _lsProducts;
  const ListViewProducts({
    Key? key,
    required List<Product> listProducts,
  })  : _lsProducts = listProducts,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _lsProducts.length,
        itemBuilder: (context, index) => ListTile(
              onTap: () {
                context.go('/details', extra: _lsProducts[index]);
              },
              title: Text(_lsProducts[index].title),
              subtitle: Text(_lsProducts[index].displayPriceInEuro()),
              leading: Hero(
                tag: _lsProducts[index].title,
                child: Image.network(
                  _lsProducts[index].image,
                  width: 70,
                  height: 70,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  context.read<CartModel>().addProduct(_lsProducts[index]);
                },
                icon: const Icon(Icons.add_box),
                color: Colors.blue,
              ),
            ));
  }
}
