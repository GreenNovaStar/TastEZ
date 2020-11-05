class Prefs {
  List<String> dairyCustom;
  List<String> flourCustom;
  List<String> fruitCustom;
  List<String> meatCustom;
  List<String> herbsCustom;
  List<String> nutsCustom;
  List<String> seafoodCustom;
  List<String> vegetCustom;
  int darkMode;

  Prefs(
      {this.dairyCustom,
        this.flourCustom,
        this.fruitCustom,
        this.meatCustom,
        this.herbsCustom,
        this.nutsCustom,
        this.seafoodCustom,
        this.vegetCustom,
        this.darkMode});

  Prefs.fromJson(Map<String, dynamic> json) {
    dairyCustom = json['dairyCustom'].cast<String>();
    flourCustom = json['flourCustom'].cast<String>();
    fruitCustom = json['fruitCustom'].cast<String>();
    meatCustom = json['meatCustom'].cast<String>();
    herbsCustom = json['herbsCustom'].cast<String>();
    nutsCustom = json['nutsCustom'].cast<String>();
    seafoodCustom = json['seafoodCustom'].cast<String>();
    vegetCustom = json['vegetCustom'].cast<String>();
    darkMode = json['darkMode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dairyCustom'] = this.dairyCustom;
    data['flourCustom'] = this.flourCustom;
    data['fruitCustom'] = this.fruitCustom;
    data['meatCustom'] = this.meatCustom;
    data['herbsCustom'] = this.herbsCustom;
    data['nutsCustom'] = this.nutsCustom;
    data['seafoodCustom'] = this.seafoodCustom;
    data['vegetCustom'] = this.vegetCustom;
    data['darkMode'] = this.darkMode;
    return data;
  }
}