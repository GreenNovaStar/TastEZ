class Ent {
  Ent({
    this.id,
    this.name,
    this.localizedName,
    this.image,
  });

  int id;
  String name;
  String localizedName;
  String image;

  factory Ent.fromJson(Map<String, dynamic> json) => Ent(
    id: json["id"],
    name: json["name"],
    localizedName: json["localizedName"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "localizedName": localizedName,
    "image": image,
  };
}