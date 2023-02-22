class ProductModel {
  final String? id;
  final String? title;
  final String? description;
  final String? imageUrl;
  final num? price;
  final String? type;
  final String? brand;
  ProductModel({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
    this.price,
    this.type,
    this.brand,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      price: json['price'],
      type: json['type'],
      brand: json['brand'],
    );
  }

  toJson() => {
        'id': id,
        'type': type,
        'brand': brand,
        'title': title,
        'price': price,
        'imageUrl': imageUrl,
        'description': description
      };
}
