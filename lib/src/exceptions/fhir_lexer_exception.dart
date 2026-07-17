import 'package:fhir_path/src/internal.dart';

/// Represents an error that occurred during the lexing phase of FHIRPath
/// parsing.
///
/// Extends [PathEngineException] so a single `on PathEngineException`
/// clause catches every expression failure — mirroring the Java reference,
/// where FHIRLexerException and PathEngineException share the FHIRException
/// root. (Programming errors still surface as [PathEngineError], an
/// [Error], deliberately outside this hierarchy.)
class FHIRLexerException extends PathEngineException {
  /// Constructor for [FHIRLexerException] with optional [message]
  /// and required [location].
  FHIRLexerException({String? message, required SourceLocation location})
      : super(message ?? '', location: location);

  @override
  String toString() => 'FHIRLexerException: $message'
      '${PathEngineException.rep(location, expression)}';
}
