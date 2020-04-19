
import Foundation

/// Empty protocol used by Sourcery to generate a `copy()` method.
///
/// Only models that implement this protocol will have a generated `copy()` method. Please see the
/// docs on how to execute the `copy()` generation.
///
protocol GeneratedCopying {

}

// MARK: - Optional aliases

public typealias Copiable<Wrapped> = Optional<Wrapped>

public typealias NullableCopiable<Wrapped> = Optional<Optional<Wrapped>>

// MARK: - Copiable.copy and NullableCopiable.copy alias

extension Copiable where Wrapped: Decodable {
    public static var copy: Wrapped? {
        nil
    }
}
