class Order {
  String id;
  bool isActive;
  double price;
  String company;
  String pictureURL;
  String buyer;
  List tags;
  String status;
  DateTime rigesterationDate;

  Order(
    this.id,
    this.isActive,
    this.price,
    this.company,
    this.pictureURL,
    this.buyer,
    this.tags,
    this.status,
    this.rigesterationDate,
  );

  factory Order.fromJson(json) {
    return Order(
      json["id"],
      json["isActive"],
      double.parse(json["price"]
          .toString()
          .replaceAll(RegExp(r'\$'), '')
          .replaceAll(RegExp(r','), '')),
      json["company"],
      json["picture"],
      json["buyer"],
      json["tags"] as List,
      json["status"],
      DateTime.parse(json["registered"]),
    );
  }
}
