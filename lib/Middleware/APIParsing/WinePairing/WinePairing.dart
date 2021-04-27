

import 'package:tastez/Middleware/APIParsing/WinePairing/ProductMatches.dart';

class WinePairing {
  List<String> pairedWines;
  String pairingText;
  ProductMatches productMatches;

  WinePairing({this.pairedWines, this.pairingText, this.productMatches});

  factory WinePairing.fromJson(Map<String, dynamic> json) => WinePairing(
    pairedWines: List<String>.from(json["pairedWines"].map((x) => WinePairing.fromJson(x))),
    pairingText: json["pairingText"],
    productMatches: ProductMatches.fromJson(json["productMatches"].map((x) => ProductMatches.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pairedWines": pairedWines,
    "pairingText": pairingText,
    // "productMatches": List<dynamic>.from(productMatches.map((x) => x.toJson())),
  };

  // factory WinePairing.fromJson(Map<String, dynamic> json) {
  //   WinePairing temp = new WinePairing();
  //   print("Hello from winepairing");
  //   print(json['pairedWines'].toString());
  //   if(json['winePairing']['pairedWines'].length > 0){
  //     temp.pairedWines = WinePairing.fromJson(json["winePairing"]) as List<String>;
  //   }
  //   // print(pairedWines = json['pairedWines'].cast<String>());
  //   // pairedWines = json['pairedWines'].cast<String>();
  //   // pairedWines = new List<String>();
  //   // json['pairedWines'].forEach((v) {
  //   //   pairedWines.add(v);
  //   // });
  //   if(json['winePairing']['pairingText'] != null){
  //     print("in wineparing .dart ");
  //     temp.pairingText = WinePairing.fromJson(json["pairingText"]) as String;
  //   }
  //   if(json['winePairing']['productMatches'].length > 0){
  //     temp.productMatches = WinePairing.fromJson(json["productMatches"]) as List<ProductMatches>;
  //   }
  //   // pairingText = json['pairingText'];
  //   // if (json['productMatches'] != null) {
  //   //   productMatches = new List<ProductMatches>();
  //   //   json['productMatches'].forEach((v) {
  //   //     productMatches.add(new ProductMatches.fromJson(v));
  //   //   });
  //   // }
  //   return new WinePairing(pairedWines: temp.pairedWines, pairingText: temp.pairingText, productMatches: temp.productMatches);
  // }
  // Map<String, dynamic> toJson() {
  //   print("hello");
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['pairedWines'] = this.pairedWines;
  //   data['pairingText'] = this.pairingText;
  //   if (this.productMatches != null) {
  //     data['productMatches'] = this.productMatches.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }

}