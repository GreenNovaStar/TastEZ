class Wines {
  String name;
  String image;
  String description;
  List<String> foodPairings;
  Wines({this.name, this.image, this.description, this.foodPairings});

  factory Wines.fromJson(Map<String, dynamic> json) => Wines(
    image: json["image"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name" : name,
    "image": image,
  };
}