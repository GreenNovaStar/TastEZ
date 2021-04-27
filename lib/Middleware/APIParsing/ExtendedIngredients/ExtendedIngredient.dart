
import 'package:tastez/Middleware/API%20Parsing/ExtendedIngredients/Consistency.dart';
import 'package:tastez/Middleware/API%20Parsing/ExtendedIngredients/Measures.dart';

class ExtendedIngredient {
  ExtendedIngredient({
    this.id,
    this.aisle,
    this.image,
    this.consistency,
    this.name,
    this.original,
    this.originalString,
    this.originalName,
    this.amount,
    this.unit,
    this.meta,
    this.metaInformation,
    this.measures,
  });

  int id;
  String aisle;
  String image;
  Consistency consistency;
  String name;
  String original;
  String originalString;
  String originalName;
  double amount;
  String unit;
  List<String> meta;
  List<String> metaInformation;
  Measures measures;

  factory ExtendedIngredient.fromJson(Map<String, dynamic> json) => ExtendedIngredient(
    id: json["id"],
    aisle: json["aisle"],
    image: json["image"],
    consistency: consistencyValues.map[json["consistency"]],
    name: json["name"],
    original: json["original"],
    originalString: json["originalString"],
    originalName: json["originalName"],
    amount: json["amount"].toDouble(),
    unit: json["unit"],
    meta: List<String>.from(json["meta"].map((x) => x)),
    metaInformation: List<String>.from(json["metaInformation"].map((x) => x)),
    measures: Measures.fromJson(json["measures"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "aisle": aisle,
    "image": image,
    "consistency": consistencyValues.reverse[consistency],
    "name": name,
    "original": original,
    "originalString": originalString,
    "originalName": originalName,
    "amount": amount,
    "unit": unit,
    "meta": List<dynamic>.from(meta.map((x) => x)),
    "metaInformation": List<dynamic>.from(metaInformation.map((x) => x)),
    "measures": measures.toJson(),
  };
}