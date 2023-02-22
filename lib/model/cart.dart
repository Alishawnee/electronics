class Cart {
  final String id;
  final String title;
  final String imageUrl;
  int quantity;
  final num price;
  Cart({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.quantity,
    required this.price,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
      id: json['id'],
      imageUrl: json['imageUrl'],
      title: json['title'],
      quantity: json['quantity'],
      price: json['price']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'imageUrl': imageUrl,
        'title': title,
        'quantity': quantity,
        'price': price
      };
}
