import 'location.dart';

class ViewPort {
  final Location northEast;
  final Location southWest;
  ViewPort({this.northEast, this.southWest});

  factory ViewPort.fromJson(Map<String, dynamic> json){
    return ViewPort(
      northEast: Location.fromJson(json['northeast']),
      southWest: Location.fromJson(json['southwest'])
    );
  }
}