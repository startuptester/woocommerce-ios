
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
    public static var copy: Wrapped? {
        nil
    }
}
