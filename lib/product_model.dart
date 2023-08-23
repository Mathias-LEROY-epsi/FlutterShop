class Product {
  String title;
  String description;
  num price;
  String image;
  String category;
  num rating;

  Product(
    this.title,
    this.description,
    this.price,
    this.image,
    this.category,
    this.rating,
  );

  Product.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        description = json['description'],
        price = json['price'],
        image = json['image'],
        category = json['category'],
        rating = json['rating']['rate'];

  String displayPriceInEuro() => "$price €";
}
