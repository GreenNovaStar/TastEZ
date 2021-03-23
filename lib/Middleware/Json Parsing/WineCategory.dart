import 'package:tastez/Middleware/Json%20Parsing/Wines.dart';

class WineCategory{
  String image;
  String categoryName;
  List<Wines> wine;
  WineCategory({this.image, this.categoryName, this.wine});

  factory WineCategory.fromJson(Map<String, dynamic> json) => WineCategory(
    image: json["image"],
    categoryName: json["categoryName"],
    wine: List<Wines>.from(json["wines"].map((x) => Wines.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "categoryName": categoryName,
    "wine": List<dynamic>.from(wine.map((x) => x.toJson())),
  };
}