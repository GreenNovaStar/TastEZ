class Metric {
  Metric({
    this.amount,
    this.unitShort,
    this.unitLong,
  });

  double amount;
  String unitShort;
  String unitLong;

  factory Metric.fromJson(Map<String, dynamic> json) => Metric(
    amount: json["amount"].toDouble(),
    unitShort: json["unitShort"],
    unitLong: json["unitLong"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "unitShort": unitShort,
    "unitLong": unitLong,
  };
}