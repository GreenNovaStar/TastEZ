import 'package:tastez/Middleware/API%20Parsing/RecipeSearchComplex.dart';

class SearchRecipe{
  List<RecipeElementComplex> results;
  int offset, number, totalResults;
  String baseUri;

  SearchRecipe({this.offset, this.number, this.results, this.totalResults, this.baseUri});

  factory SearchRecipe.fromJson(Map<String, dynamic> json) => SearchRecipe(
    offset: json["offset"],
    number: json["number"],
    totalResults: json["totalResults"],
    results: List<RecipeElementComplex>.from(json["results"].map((x) => RecipeElementComplex.fromJson(x))),
    baseUri: json["baseUri"],
  );

  Map<String, dynamic> toJson() => {
    "offset": offset,
    "number": number,
    "totalResults": totalResults,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "baseUri": baseUri,
  };
}