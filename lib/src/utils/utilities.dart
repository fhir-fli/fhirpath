/// String helpers used by the engine, ported from org.hl7.fhir.utilities
/// (same semantics as the copies in Ucum-java). These previously leaked in
/// through package:ucum's barrel; since ucum 0.9.0 curates its exports, the
/// engine owns them.
abstract class Utilities {
  /// True when [v] is null or empty (Java Utilities.noString).
  static bool noString(String? v) {
    return v == null || v.isEmpty;
  }

  /// True when [string] parses as an integer (Java Utilities.isInteger).
  static bool isInteger(String string) {
    return int.tryParse(string) != null;
  }

  /// True when [string] parses as a decimal (Java Utilities.isDecimal).
  static bool isDecimal(String string) {
    if (noString(string)) {
      return false;
    }
    return double.tryParse(string) != null;
  }
}
