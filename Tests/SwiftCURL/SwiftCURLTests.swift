import XCTest
import CCurl
@testable import SwiftCURL

class SwiftCURLTests: XCTestCase {
    
    
    func testExample() {
        let curl = cURL()
        
        do {
            try curl.setOption(option: CURLOPT_URL, "smtps://smtp.qq.com:465")
            try curl.setOption(option: CURLOPT_USE_SSL, Int(CURLUSESSL_ALL.rawValue))
            try curl.setOption(option: CURLOPT_USERNAME, "314099323@qq.com")
            try curl.setOption(option: CURLOPT_PASSWORD, "1111111111")
            try curl.setOption(option: CURLOPT_MAIL_FROM, "<314099323@qq.com>")
            try curl.setOption(option: CURLOPT_MAIL_RCPT, ["<314099323@qq.com>", "<jeffreyzeng@me.com>"])
            
            
            let content = "Date: Mon, 29 Nov 2010 21:54:29 +1100\r\n"+"To: \"ME\" <314099323@qq.com>\r\n"+"From: \"ME\" <314099323@qq.com>\r\n"+"Cc: \"ME\" <jeffreyzeng@me.com>\r\n"+"Message-ID: <dcd7cb36-11db-487a-9f3a-e652a9458efd@rfcpedant.example.org>\r\n"+"Subject: SMTP SSL example message\r\n"+"\r\n"+"The body of the message starts here.\r\n"+"\r\n"+"It could be a lot of lines, could be MIME encoded, whatever.\r\n"+"Check RFC5322.\r\n"
            let payloadStorage = cURL.ReadFunctionStorage(data: content.data(using: .ascii)!)
            try curl.setOption(option: CURLOPT_READFUNCTION, curlReadFunction)
            try curl.setOption(option: CURLOPT_READDATA, payloadStorage)
            
            try curl.setOption(option: CURLOPT_UPLOAD, 1)
            
            try curl.perform()
        } catch let error {
            print(error)
        }
    }


    static var allTests : [(String, (SwiftCURLTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
