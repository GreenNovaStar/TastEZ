import 'package:tastez/Middleware/APIParsing/AnalyzedInstruction/Ent.dart';
import 'package:tastez/Middleware/APIParsing/AnalyzedInstruction/Length.dart';

class Step {
  Step({
    this.number,
    this.step,
    this.ingredients,
    this.equipment,
    this.length,
  });

  int number;
  String step;
  List<Ent> ingredients;
  List<Ent> equipment;
  Length length;

  factory Step.fromJson(Map<String, dynamic> json) =>
      Step(
        number: json["number"],
        step: json["step"],
        ingredients: List<Ent>.from(
            json["ingredients"].map((x) => Ent.fromJson(x))),
        equipment: List<Ent>.from(
            json["equipment"].map((x) => Ent.fromJson(x))),
        length: json["length"] == null ? null : Length.fromJson(json["length"]),
      );

  Map<String, dynamic> toJson() =>
      {
        "number": number,
        "step": step,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
        "equipment": List<dynamic>.from(equipment.map((x) => x.toJson())),
        "length": length == null ? null : length.toJson(),
      };
}