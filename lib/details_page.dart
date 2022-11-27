import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'product_model.dart';

class DetailsPage extends StatelessWidget {
  final Product product;
  const DetailsPage(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Détails du produit')),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Hero(
              tag: product.title,
              child: Image.network(
                product.image,
                width: 200,
                height: 200,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 8.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Note :",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: RatingBarIndicator(
                        rating: product.rating.toDouble(),
                        itemBuilder: (context, index) =>
                            const Icon(Icons.star, color: Colors.amber),
                        itemCount: 5,
                        itemSize: 25.0,
                        unratedColor: Colors.grey,
                        direction: Axis.horizontal),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Prix :",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    product.displayPriceInEuro(),
                    style: const TextStyle(
                      fontSize: 30.0,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 6.0),
            child: Text(
              "Titre du produit :",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            child: Text(product.title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16.0)),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 6.0),
            child: Text(
              "Catégorie :",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            child: Text(product.category,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16.0)),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 6.0),
            child: Text(
              "Description :",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            child: Text(product.description,
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 16.0)),
          ),
        ],
      ),
    );
  }
}
