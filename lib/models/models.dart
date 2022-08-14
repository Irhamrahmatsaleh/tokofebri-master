class Product {
  final int id;
  final String name;
  final String cover;
  final int price;
  final String desc;

  Product({
    required this.id,
    required this.name,
    required this.cover,
    required this.price,
    required this.desc,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      desc: json['desc'],
      price: json['price'],
      cover: json['cover'],
    );
  }
}
