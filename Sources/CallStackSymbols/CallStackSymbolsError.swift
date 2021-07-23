//
//  CallStackSymbolsError.swift
//  
//
//  Created by Naruki Chigira on 2021/07/23.
//

import Foundation

public enum CallStackSymbolsError: Error {
    case failedToParseCallStackSymbol(String)
}
