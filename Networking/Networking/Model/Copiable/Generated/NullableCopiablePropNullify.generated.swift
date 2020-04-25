// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// The `.nullify` is an alias for `.some(nil)` which is used to set a `NullableCopiableProp`
// property to `nil`. The `.nullify` alias can be used to provide more clarity.
//
// ## Why Does This Have to be Generated?
//
// Unlike the `.copy` alias, this has to be generated as there doesn't seem to be a way to
// make this code pattern generic:
//
// ```
// extension NullableCopiable where Wrapped == String? {
//    public static let nullify = Self.some(nil)
// }
// ```
//
// If you can find a way to write that like the `static var copy` implementation, then please
// let us know!
//

extension NullableCopiableProp where Wrapped == Date? {
    public static let nullify = Self.some(nil)
}

extension NullableCopiableProp where Wrapped == String? {
    public static let nullify = Self.some(nil)
}
