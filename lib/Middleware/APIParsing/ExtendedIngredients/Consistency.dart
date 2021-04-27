import 'package:tastez/Middleware/API%20Parsing/EnumValues.dart';

enum Consistency { SOLID, LIQUID }

final consistencyValues = EnumValues({
  "liquid": Consistency.LIQUID,
  "solid": Consistency.SOLID
});