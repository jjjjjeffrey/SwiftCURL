//
//  cURLWriteFunction.swift
//  SwiftCURL
//
//  Created by zengdaqian on 16/6/30.
//
//

import CCurl

public extension cURL {
    
    public typealias WriteCallBack = curl_write_callback
    
    public static var WriteFunction: WriteCallBack { return curlWriteFunction }
    
    public final class WriteFunctionStorage {
        
        public var data = [CChar]()
        
        public init() { }
    }
}

public func curlWriteFunction(contents: UnsafeMutablePointer<Int8>?, size: Int, nmemb: Int, readData: UnsafeMutablePointer<Void>?) -> Int {
    
    let storage = unsafeBitCast(readData, to: cURL.WriteFunctionStorage.self)
    
    let realsize = size * nmemb
    
    guard var pointer = contents else { return 0 }
    
    for _ in 1...realsize {
        
        let byte = pointer.pointee
        
        storage.data.append(byte)
        
        pointer = pointer.successor()
    }
    
    return realsize
}
