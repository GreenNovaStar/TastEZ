class Prefs {
  int dummy;
  Prefs({this.dummy});
  Prefs.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    return data;
  }
}