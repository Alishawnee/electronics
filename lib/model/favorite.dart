class Favorite {
  final String? iduser;
  final String? idProduct;
  final bool isFavorite;
  Favorite({
    this.iduser,
    this.idProduct,
    this.isFavorite = false,
  });
  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
      iduser: json['iduser'],
      isFavorite: json['fav'],
      idProduct: json['idProduct']);

  Map<String, dynamic> toMap() {
    return {'iduser': iduser, 'fav': isFavorite, 'idproduct': idProduct};
  }
}
