//
//  cURLError.swift
//  SwiftCURL
//
//  Created by zengdaqian on 16/6/30.
//
//

import CCurl

public extension cURL {
    
    public enum Error: UInt32, ErrorProtocol, CustomStringConvertible {
        
        case UnsupportedProtocol        = 1
        case FailedInitialization
        case BadURLFormat
        case NotBuiltIn
        case CouldNotResolveProxy
        case CouldNotResolveHost
        case CouldNotConnect
        case FTPBadServerReply
        case RemoteAccessDenied
        
        // TODO: Implement all error codes
        
        /// There was a problem reading a local file or an error returned by the read callback.
        case ReadCallback = 26
        
        case OperationTimeout = 28
        
        case BadFunctionArgument = 45
        
        case Unknown1 = 56
        
        public var description: String {
            
            let errorDescription = String(validatingUTF8: curl_easy_strerror(CURLcode(rawValue: self.rawValue)))
            return errorDescription ?? "cURL.Error(\(self.rawValue))"
        }
    }
}
