

import 'package:tastez/Middleware/API%20Parsing/ExtendedIngredients/Metric.dart';

class Measures {
  Measures({
    this.us,
    this.metric,
  });

  Metric us;
  Metric metric;

  factory Measures.fromJson(Map<String, dynamic> json) => Measures(
    us: Metric.fromJson(json["us"]),
    metric: Metric.fromJson(json["metric"]),
  );

  Map<String, dynamic> toJson() => {
    "us": us.toJson(),
    "metric": metric.toJson(),
  };
}