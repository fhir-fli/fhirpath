# fhirpath

Model-independent FHIRPath engine in Dart — a port of the Java reference
implementation (`org.hl7.fhir.core` FHIRPathEngine).

No FHIR model dependency: runtime data is navigated through the `FhirNode`
reflection contract (package `fhir_node`), and all FHIR-version knowledge —
type metadata, terminology, value construction — is supplied at the boundary
via the `IWorkerContext` / `IFhirValueFactory` interfaces. The FHIR bindings
live in the `fhir_r4_path` / `fhir_r5_path` / `fhir_r6_path` packages, which
is what applications normally depend on.

## Usage (through a binding)

```dart
import 'package:fhir_r4_path/fhir_r4_path.dart';

final engine = await FHIRPathEngine.create(WorkerContext());

// Parse once, evaluate many — cache the ExpressionNode yourself; the
// engine is deliberately cache-free, like the Java reference. Parsed
// nodes are tied to the value factory (binding) that parsed them.
final expr = engine.parse('Patient.name.given');
final result = await engine.evaluate(patient, expr);
```

Conformance: the official FHIRPath test suite runs against all three
bindings (1070 tests each). The engine repo carries its own parser/lexer
tests over a stub model (see `example/`).

## Error handling

Every expression failure — lexing, parsing, evaluation — extends
`PathEngineException`, so one catch clause covers them all
(`FHIRLexerException` is a subtype, mirroring Java's shared `FHIRException`
root). `PathEngineError` (an `Error`) is reserved for programming mistakes
and should not be caught.

## Implementing your own binding

Implement `FhirNode` (package `fhir_node`) for your data model and the
`IWorkerContext` / `IFhirValueFactory` interfaces for type metadata and
value construction. `example/stub_model.dart` is a complete minimal
implementation; the `fhir_r*_path` packages are the production ones.

## Credits

A port of the FHIRPathEngine from
[org.hl7.fhir.core](https://github.com/hapifhir/org.hl7.fhir.core)
(BSD-3-Clause, © HL7 / Health Intersections). Part of the
[fhir-fli](https://github.com/fhir-fli) ecosystem. MIT licensed.
