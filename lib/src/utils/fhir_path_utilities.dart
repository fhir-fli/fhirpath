// ignore_for_file: public_member_api_docs

import 'package:fhir_path/src/internal.dart';
import 'package:fhir_path/src/utils/path_string_extensions.dart';

// Utility function
bool isWhitespace(dynamic value) {
  if (value is String) {
    return value.isWhiteSpace();
  } else if (value is int) {
    return value.isWhitespace();
  } else {
    return false;
  }
}
