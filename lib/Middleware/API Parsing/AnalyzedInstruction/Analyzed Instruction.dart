import 'package:tastez/Middleware/API%20Parsing/AnalyzedInstruction/Step.dart';

class AnalyzedInstruction {
  AnalyzedInstruction({
    this.name,
    this.steps,
  });

  String name;
  List<Step> steps;


  factory AnalyzedInstruction.fromJson(Map<String, dynamic> json) => AnalyzedInstruction(
    name: json["name"],
    steps: List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "steps": List<dynamic>.from(steps.map((x) => x.toJson())),
  };
}