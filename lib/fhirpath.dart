/// Model-independent FHIRPath engine. No FHIR dependency — data is navigated
/// through the `FhirNode` contract (package fhir_node) and version knowledge
/// is supplied at the boundary via the [IWorkerContext] /
/// [IFhirValueFactory] interfaces (FHIR bindings live in the fhir_r*_path
/// packages).
///
/// Typical use goes through a binding, but the engine surface is:
/// [FHIRPathEngine.create] → [FHIRPathEngine.parse] (once per expression —
/// parsed [ExpressionNode]s should be cached by the caller and are tied to
/// the [IFhirValueFactory] that parsed them) → `evaluate*`. All expression
/// failures extend [PathEngineException]; programming errors surface as
/// [PathEngineError].
///
/// The implementation collaborators (FhirPathFunctions/Operations/Utilities,
/// the equality kernel, string/number helpers) are internal and deliberately
/// not exported.
library;

// The engine and its parse/evaluate surface.
export 'src/engine/collection_status.dart';
export 'src/engine/execution_context.dart';
export 'src/engine/execution_type_context.dart';
export 'src/engine/expression_node.dart';
export 'src/engine/expression_node_with_offset.dart';
export 'src/engine/fhir_constants.dart';
// FHIRLexer is public API: the FHIR Mapping Language parser lexes with it,
// exactly as Java's StructureMapUtilities uses the reference FHIRLexer.
export 'src/engine/fhir_lexer.dart';
export 'src/engine/fhir_path_context.dart';
export 'src/engine/fhir_path_engine.dart';
export 'src/engine/fp_function.dart';
export 'src/engine/fp_operation.dart';
export 'src/engine/function_details.dart';
// The boundary interfaces a binding implements.
export 'src/engine/i_evaluation_context.dart';
export 'src/engine/i_fhir_value_factory.dart';
export 'src/engine/i_worker_context.dart';
export 'src/engine/source_location.dart';
// Exceptions: PathEngineException is the catchable root for all expression
// failures (FHIRLexerException extends it); PathEngineError is for
// programming errors.
export 'src/exceptions/fhir_lexer_exception.dart';
export 'src/exceptions/path_engine_error.dart';
export 'src/exceptions/path_engine_exception.dart';
// Type machinery surfaced by check/evaluateFunctionType and the bindings.
export 'src/types/fhir_publication.dart';
export 'src/types/profiled_type.dart';
export 'src/types/system_temporal.dart';
export 'src/types/type_details.dart';
// Small helpers the bindings and the FML engine consume.
export 'src/utils/utilities.dart';
export 'src/utils/version_utilities.dart';
export 'src/validation/validation_options.dart';
