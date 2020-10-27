class User {
  final int id;
  final String name;
  final String email;
  final String hPass;
  List<String> prefs;
  List<List<String>> pantry;

  User({this.id, this.name, this.email, this.hPass, this.prefs, this.pantry});
}