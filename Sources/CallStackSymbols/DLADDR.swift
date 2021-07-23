//
//  DLADDR.swift
//  
//
//  Created by Naruki Chigira on 2021/07/23.
//

import Foundation

/// This struct defined based on information from '$ man dladdr'.
public struct DLADDR: Hashable, Equatable, Codable {
    /// The depth of call.
    public let depth: Int
    /// The pathname of the shared object containing the address.
    public let fname: String
    /// The base address (mach_header) at which the image is mapped into the address space of the calling process.
    public let fbase: UInt64
    /// The name of the nearest run-time symbol with a value less than or equal to addr.
    public let sname: String
    /// The value of the symbol returned in dli_sname.
    public let saddr: UInt64

    public var laddr: UInt64 {
        fbase - saddr
    }

    public var fbase16Radix: String {
        "0x\(String(fbase, radix: 16))"
    }

    public var laddr16Radix: String {
        "0x\(String(laddr, radix: 16))"
    }

    public var callStackSymbolRepresentation: String {
        "\(depth) \(fname) 0x\(String(fbase, radix: 16)) \(sname) + \(saddr)"
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(depth)
        hasher.combine(fname)
        hasher.combine(sname)
        hasher.combine(saddr)
    }
}

public func ==(lhs: DLADDR, rhs: DLADDR) -> Bool {
    lhs.depth == rhs.depth && lhs.fname == rhs.fname && lhs.sname == rhs.sname && lhs.saddr == rhs.saddr
}

