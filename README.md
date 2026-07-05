# fhirpath

Model-independent FHIRPath engine in Dart — a port of the Java reference
implementation (`org.hl7.fhir.core` FHIRPathEngine).

No FHIR model dependency: runtime data is navigated through the `FhirNode`
reflection contract (package `fhir_node`), and all FHIR-version knowledge —
type metadata, terminology, value construction — is supplied at the boundary
via the `IWorkerContext` / `IFhirValueFactory` interfaces. The FHIR bindings
live in the `fhir_r4_path` / `fhir_r5_path` / `fhir_r6_path` packages, which
is what applications normally depend on.
