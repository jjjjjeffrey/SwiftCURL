//
//  cURLStringList.swift
//  SwiftCURL
//
//  Created by zengdaqian on 16/6/30.
//
//

import CCurl

public extension cURL.StringList {
    
    init(strings: [String]) {
        
        self = curl_slist()
        
        for string in strings {
            
            self.append(string: string)
        }
    }
    
    var value: String? { return String(validatingUTF8: data) }
    
    mutating func append(string: String) { curl_slist_append(&self, string) }
    
    mutating func free() { curl_slist_free_all(&self) }
}
