//
//  Updateable.swift
//  IDZSwiftCommonCrypto
//
//  Created by idz on 9/16/15.
//  Copyright © 2015 iOSDeveloperZone.com. All rights reserved.
//

import Foundation

///
/// A protocol for calculations that can be updated with incremental data buffers.
///
public protocol Updateable {
    /// Status of the calculation.
    var status : Status { get }
    /// Low-level update routine.
    /// Updates the calculation with the contents of a data buffer.
    /// - parameter buffer: pointer to the data buffer 
    /// - parameter byteCount: length of the buffer in bytes
    /// - returns: self if no error for optional chaining, null otherwise
    @discardableResult func update(_ buffer : UnsafeRawPointer, _ byteCount : size_t) -> Self?
}

///
/// Factors out common update code from Digest, HMAC and Cryptor.
///
extension Updateable {
    ///
    /// Updates the current calculation with data contained in an `NSData` object.
    ///
    /// - parameters data: the data buffer
    ///
    public func update(_ data: Data) -> Self?
    {
        _ = update((data as NSData).bytes, size_t(data.count))
        return self.status == Status.success ? self : nil
    }
    ///
    /// Updates the current calculation with data contained in a Swift array.
    ///
    /// - parameters byteArray: the Swift array
    ///
    public func update(_ byteArray : [UInt8]) -> Self?
    {
        _ = update(byteArray, size_t(byteArray.count))
        return self.status == Status.success ? self : nil
    }
    ///
    /// Updates the current calculation with data contained in a Swift string.
    /// The corresponding data will be generated using UTF8 encoding.
    ///
    /// - parameters string: the Swift string
    ///
    public func update(_ string: String) -> Self?
    {
        _ = update(string, size_t(string.lengthOfBytes(using: String.Encoding.utf8)))
        return self.status == Status.success ? self : nil
    }
}
