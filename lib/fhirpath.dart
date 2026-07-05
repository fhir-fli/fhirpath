/// Model-independent FHIRPath engine. No FHIR dependency — data is navigated
/// through the `FhirNode` contract (package fhir_node) and version knowledge
/// is supplied at the boundary via the `IWorkerContext` /
/// `IFhirValueFactory` interfaces (FHIR bindings live in the fhir_r*_path
/// packages).
library;

export 'src/engine.dart';
export 'src/exceptions.dart';
export 'src/types.dart';
export 'src/utils.dart';
export 'src/validation.dart';
