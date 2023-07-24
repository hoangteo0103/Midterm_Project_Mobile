class Product {
  final String name, image, coverImage;
  final double price;
  int id;

  Map toJson() {
    return {
      'name': name,
      'price': price,
      'image': image,
    };
  }

  Product(
      {required this.id,
      required this.name,
      required this.image,
      required this.coverImage,
      required this.price});
}

List<Product> demoCarts = [];
List<Product> products = [
  Product(
      id: 1,
      name: 'Espresso',
      image: 'assets/images/espresso.webp',
      coverImage: 'assets/images/espresso.svg',
      price: 3.0),
  Product(
      id: 2,
      name: 'Cappuccino',
      image: 'assets/images/cappucino.jpg',
      coverImage: 'assets/images/cappuccino.svg',
      price: 2.0),
  Product(
      id: 3,
      name: 'Macchiato',
      image: 'assets/images/machiato.jpg',
      coverImage: 'assets/images/macchiato.svg',
      price: 4.0),
  Product(
    id: 4,
    name: 'Mocha',
    image: 'assets/images/mocha.jpg',
    price: 2.5,
    coverImage: 'assets/images/mocha.svg',
  ),
];
