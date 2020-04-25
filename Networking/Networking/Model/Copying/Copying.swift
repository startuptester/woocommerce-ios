
import Foundation

/// Empty protocol used by Sourcery to generate a `copy()` method.
///
/// Only models that implement this protocol will have a generated `copy()` method. Please see the
/// docs on how to execute the `copy()` generation.
///
protocol GeneratedCopying {

}

protocol GeneratedCopiablePropType {

}

// MARK: - Optional aliases



public typealias Copiable<Wrapped> = Optional<Wrapped>

public typealias NullableCopiable<Wrapped> = Copiable<Wrapped?>

// MARK: - Copiable.copy and NullableCopiable.copy alias

extension Copiable where Wrapped: Decodable {
    public static var copy: Wrapped? {
        nil
    }
}

extension Copiable where Wrapped == NSDecimalNumber {
    public static let copy: Wrapped? = nil
}

// MARK: - NullableCopiable.nullify alias

extension String: GeneratedCopiablePropType { }
extension Bool: GeneratedCopiablePropType { }
extension Int: GeneratedCopiablePropType { }
extension Int8: GeneratedCopiablePropType { }
extension Int16: GeneratedCopiablePropType { }
extension Int32: GeneratedCopiablePropType { }
extension Int64: GeneratedCopiablePropType { }
extension Decimal: GeneratedCopiablePropType { }
extension NSDecimalNumber: GeneratedCopiablePropType { }
extension Date: GeneratedCopiablePropType { }
