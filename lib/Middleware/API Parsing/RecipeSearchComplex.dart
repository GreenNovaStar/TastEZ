class RecipeElementComplex{

  int id, calories;
  String carbs, fat, protein, image, imageType, title;

  RecipeElementComplex({this.id, this.calories, this.carbs, this.fat, this.protein, this.image, this.imageType, this.title});


  factory RecipeElementComplex.fromJson(Map<String, dynamic> json) => RecipeElementComplex(
    id: json["id"],
    calories: json["calories"],
    carbs: json["totalResults"],
    fat: json["fat"],
    protein: json["protein"],
    image: json["image"],
    imageType: json["imageType"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "calories": calories,
    "carbs": carbs,
    "fat": fat,
    "protein": protein,
    "image": image,
    "imageType": imageType,
    "title": title,
  };

}