import 'package:tastez/Middleware/APIParsing/EnumValues.dart';

enum Consistency { SOLID, LIQUID }

final consistencyValues = EnumValues({
  "liquid": Consistency.LIQUID,
  "solid": Consistency.SOLID
});