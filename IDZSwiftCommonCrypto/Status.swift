//
//  Status.swift
//  IDZSwiftCommonCrypto
//
//  Created by idz on 9/23/14.
//  Copyright (c) 2014 iOSDeveloperZone.com. All rights reserved.
//

import Foundation
import CommonCrypto

///
/// Links the native CommonCryptoStatus enumeration to Swiftier versions.
///
public enum Status : CCCryptorStatus, CustomStringConvertible, Error
{
    /// Successful
    case success
    /// Parameter Error
    case paramError
    /// Buffer too Small
    case bufferTooSmall
    /// Memory Failure
    case memoryFailure
    /// Alignment Error
    case alignmentError
    /// Decode Error
    case decodeError
    /// Unimplemented
    case unimplemented
    /// Overflow
    case overflow
    /// Random Number Generator Err
    case rngFailure
    
    ///
    /// Converts this value to a native `CCCryptorStatus` value.
    ///
    public func toRaw() -> CCCryptorStatus
    {
        switch self {
        case .success:          return CCCryptorStatus(kCCSuccess)
        case .paramError:       return CCCryptorStatus(kCCParamError)
        case .bufferTooSmall:   return CCCryptorStatus(kCCBufferTooSmall)
        case .memoryFailure:    return CCCryptorStatus(kCCMemoryFailure)
        case .alignmentError:   return CCCryptorStatus(kCCAlignmentError)
        case .decodeError:      return CCCryptorStatus(kCCDecodeError)
        case .unimplemented:    return CCCryptorStatus(kCCUnimplemented)
        case .overflow:         return CCCryptorStatus(kCCOverflow)
        case .rngFailure:       return CCCryptorStatus(kCCRNGFailure)
        }
    }
    
    ///
    /// Human readable descriptions of the values. (Not needed in Swift 2.0?)
    ///
	static let descriptions: [Status: String] = [
		.success: "Success",
		.paramError: "ParamError",
		bufferTooSmall: "BufferTooSmall",
		memoryFailure: "MemoryFailure",
		alignmentError: "AlignmentError",
		decodeError: "DecodeError",
		unimplemented: "Unimplemented",
		overflow: "Overflow",
		rngFailure: "RNGFailure"
	]
    
    ///
    /// Obtain human-readable string from enum value.
    ///
    public var description : String
    {
        return (Status.descriptions[self] != nil) ? Status.descriptions[self]! : ""
    }
    ///
    /// Create enum value from raw `CCCryptorStatus` value.
    ///
    public static func fromRaw(_ status : CCCryptorStatus) -> Status?
    {
        var from = [ kCCSuccess: success, kCCParamError: paramError,
            kCCBufferTooSmall: bufferTooSmall, kCCMemoryFailure: memoryFailure,
            kCCAlignmentError: alignmentError, kCCDecodeError: decodeError, kCCUnimplemented: unimplemented,
            kCCOverflow: overflow, kCCRNGFailure: rngFailure]
        return from[Int(status)]
    
    }
}
