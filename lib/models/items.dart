class Items {
  int? id;
  String? brand;
  String? name;
  String? image;
  int? quantity;
  bool? like;

  Items({this.id, this.brand, this.image, this.name, this.like, this.quantity});
}

List<Items> trending = [
  Items(
      id: 0,
      brand: 'Noom',
      name: 'Candle holder',
      image: 'assets/images/candle_holder.jpeg',
      like: false,
      quantity: 0),
  Items(
      id: 1,
      brand: 'Noom',
      name: 'Noom Vase',
      image: 'assets/images/gabo.jpg',
      like: false,
      quantity: 0),
  Items(
      id: 2,
      brand: 'Noom',
      name: 'Noom Vase',
      image: 'assets/images/gabo2.jpg',
      like: false,
      quantity: 0)
];

List<Items> decor = [
  Items(
      id: 3,
      brand: 'Decor',
      name: 'Decor one',
      image: 'assets/images/decor.jpeg',
      like: false,
      quantity: 0),
  Items(
      id: 4,
      brand: 'Decor',
      name: 'Decor two',
      image: 'assets/images/decor1.jpeg',
      like: false,
      quantity: 0),
  Items(
      id: 5,
      brand: 'Decor',
      name: 'Decor three',
      image: 'assets/images/decor2.jpeg',
      like: false,
      quantity: 0)
];

List<Items> chairs = [
  Items(
      id: 6,
      brand: 'Chairs',
      name: 'Ash single',
      image: 'assets/images/chairs.jpeg',
      like: false,
      quantity: 0),
  Items(
      id: 7,
      brand: 'Chair',
      name: 'Green single',
      image: 'assets/images/chairs1.jpeg',
      like: false,
      quantity: 0),
  Items(
      id: 8,
      brand: 'Chair',
      name: ' Black single',
      image: 'assets/images/chairs2.jpeg',
      like: false,
      quantity: 0)
];
