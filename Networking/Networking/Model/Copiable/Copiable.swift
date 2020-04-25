
import Foundation

/// Empty protocol used by Sourcery to generate a `copy()` method.
///
/// Only models that implement this protocol will have a generated `copy()` method. Please see the
/// docs on how to execute the `copy()` generation.
///
protocol GeneratedCopiable {

}

// MARK: - Optional Aliases

public typealias CopiableProp<Wrapped> = Optional<Wrapped>

public typealias NullableCopiableProp<Wrapped> = CopiableProp<Wrapped?>

// MARK: - Support for `.copy` alias

extension CopiableProp {
    /// Allow `CopiableProp<>` declarations to use a `.copy` alias as the default value instead of
    /// using `nil`.
    ///
    /// For example, instead of declaring `copy()` arguments like this:
    ///
    /// ```
    /// func copy(orderID: CopiableProp<Int> = nil)
    /// ```
    ///
    /// We can declare them like this:
    ///
    /// ```
    /// func copy(orderID: CopiableProp<Int> = .copy)
    /// ```
    ///
    /// Using `.copy` makes it a bit more clearer what will happen if you don't declare or
    /// provide a different value.
    ///
    static var copy: Wrapped? {
        nil
    }
}

// MARK: - Support for `.nullify` alias

/// Empty protocol used by Sourcery to generate a `.nullify` alias for the type.
///
/// The `.nullify` is an alias for `.some(nil)` which is used to set a `NullableCopiableProp`
/// property to `nil`. The `.nullify` alias can be used to provie more clarity.
///
/// This will only need to be conformed to types that we don't own like the Foundation types
/// below. For everything else, the Sourcery generator will automatically determine what needs
/// to have `.nullify` support.
///
/// ## Why Does This Have to be Generated?
///
/// Unlike the `.copy` alias, this has to be generated as there doesn't seem to be a way to
/// make this code pattern generic:
///
/// ```
/// extension NullableCopiable where Wrapped == String? {
///    public static let nullify = Self.some(nil)
/// }
/// ```
///
/// If you can find a way to write that like the `static var copy` implementation, then please
/// let us know!
///
protocol GeneratedNullableCopiablePropNullify {

}

extension String: GeneratedNullableCopiablePropNullify { }
extension Bool: GeneratedNullableCopiablePropNullify { }
extension Int: GeneratedNullableCopiablePropNullify { }
extension Int8: GeneratedNullableCopiablePropNullify { }
extension Int16: GeneratedNullableCopiablePropNullify { }
extension Int32: GeneratedNullableCopiablePropNullify { }
extension Int64: GeneratedNullableCopiablePropNullify { }
extension Decimal: GeneratedNullableCopiablePropNullify { }
extension NSDecimalNumber: GeneratedNullableCopiablePropNullify { }
extension Date: GeneratedNullableCopiablePropNullify { }
