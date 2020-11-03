class UserDatabase {
  List<User> users;

  UserDatabase({this.users});

  UserDatabase.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = new List<User>();
      json['users'].forEach((v) {
        users.add(new User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.users != null) {
      data['users'] = this.users.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int id;
  String name;
  String email;
  String hPass;
  Prefs prefs;
  Pantry pantry;

  User({this.id, this.name, this.email, this.hPass, this.prefs, this.pantry});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    hPass = json['hPass'];
    prefs = json['prefs'] != null ? new Prefs.fromJson(json['prefs']) : null;
    pantry =
    json['pantry'] != null ? new Pantry.fromJson(json['pantry']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['hPass'] = this.hPass;
    if (this.prefs != null) {
      data['prefs'] = this.prefs.toJson();
    }
    if (this.pantry != null) {
      data['pantry'] = this.pantry.toJson();
    }
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'name' : name,
      'email' : email,
      'hPass' : hPass,
      'prefs' : prefs.toJson(),
      'pantry' : pantry.toJson(),
    };
  }
}

class Prefs {
  int darkMode;

  Prefs({this.darkMode});

  Prefs.fromJson(Map<String, dynamic> json) {
    darkMode = json['darkMode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['darkMode'] = this.darkMode;
    return data;
  }
}

class Pantry {
  List<String> dairy;
  List<String> flour;
  List<String> fruit;
  List<String> meat;
  List<String> herbs;
  List<String> nuts;
  List<String> seafood;
  List<String> veget;

  Pantry(
      {this.dairy,
        this.flour,
        this.fruit,
        this.meat,
        this.herbs,
        this.nuts,
        this.seafood,
        this.veget});

  Pantry.fromJson(Map<String, dynamic> json) {
    dairy = json['dairy'].cast<String>();
    flour = json['flour'].cast<String>();
    fruit = json['fruit'].cast<String>();
    meat = json['meat'].cast<String>();
    herbs = json['herbs'].cast<String>();
    nuts = json['nuts'].cast<String>();
    seafood = json['seafood'].cast<String>();
    veget = json['veget'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dairy'] = this.dairy;
    data['flour'] = this.flour;
    data['fruit'] = this.fruit;
    data['meat'] = this.meat;
    data['herbs'] = this.herbs;
    data['nuts'] = this.nuts;
    data['seafood'] = this.seafood;
    data['veget'] = this.veget;
    return data;
  }
}
