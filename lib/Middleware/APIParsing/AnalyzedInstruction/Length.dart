class Length {
  Length({
    this.number,
    this.unit,
  });

  int number;
  String unit;

  factory Length.fromJson(Map<String, dynamic> json) => Length(
    number: json["number"],
    unit: json["unit"],
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "unit": unit,
  };
}