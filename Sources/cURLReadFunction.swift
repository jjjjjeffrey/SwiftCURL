//
//  cURLReadFunction.swift
//  SwiftCURL
//
//  Created by zengdaqian on 16/6/30.
//
//

import CCurl
import Foundation

public extension cURL {
    
    public typealias ReadCallBack = curl_read_callback
    
    public static var ReadFunction: ReadCallBack { return curlReadFunction }
    
    public final class ReadFunctionStorage {
        
        public let data: Data
        
        public var currentIndex = 0
        
        public init(data: Data) {
            
            self.data = data
        }
    }
}

public func curlReadFunction(pointer: UnsafeMutablePointer<Int8>?, size: Int, nmemb: Int, readData: UnsafeMutablePointer<Void>?) -> Int {
    
    let storage = unsafeBitCast(readData, to: cURL.ReadFunctionStorage.self)
    
    let data = storage.data
    
    let currentIndex = storage.currentIndex
    
    guard (size * nmemb) > 0 else { return 0 }
    
    guard currentIndex < data.count else { return 0 }
    
    let byte = data[currentIndex]
    
    let char = UInt8(byte)
    
    let ptr = unsafeBitCast(pointer, to: UnsafeMutablePointer<UInt8>.self)
    
    ptr.pointee = char
    
    storage.currentIndex += 1
    
    return 1
}

