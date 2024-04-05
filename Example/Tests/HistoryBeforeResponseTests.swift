//
//  HistoryBeforeResponseTests.swift
//  WebimClientLibrary_Tests
//
//  Created by Nikita Lazarev-Zubov on 19.02.18.
//  Copyright © 2018 Webim. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Foundation
@testable import WebimMobileSDK
import XCTest

class HistoryBeforeResponseTests: XCTestCase {

    var sut: HistoryBeforeResponse!
    var nullSut: HistoryBeforeResponse!

    private let defaultHistoryBeforeResponseJson = """
    {
       "result":"ok",
       "data":{
          "hasMore":true,
          "messages":[
             {
                "avatar":"/webim/images/avatar/demo_33201.png",
                "chatId":"2470",
                "authorId":33201,
                "data":null,
                "id":"26066",
                "ts_m":1518178864048925,
                "text":"5",
                "clientSideId":"2b29154364e14cf8b3823267740ac090",
                "kind":"operator",
                "name":"Administrator"
             },
             {
                "avatar":null,
                "chatId":"2470",
                "authorId":null,
                "data":null,
                "id":"26068",
                "ts_m":1518181740640531,
                "text":"Text",
                "clientSideId":"b91d616953a4d05c3df82f63359ebb58",
                "kind":"file_visitor",
                "name":"Никита"
             }
          ]
       }
    }
    """

    private let nullHistoryBeforeResponseDataJson = """
    {
       "result":"ok",
       "data":{
          "hasMore":null,
          "messages": null
       }
    }
    """

    private let nullHistoryBeforeResponseJson = "{ }"

    override func setUp() {
        super.setUp()
        sut = HistoryBeforeResponse(jsonDictionary: convertToDict(defaultHistoryBeforeResponseJson))
        nullSut = HistoryBeforeResponse(jsonDictionary: convertToDict(nullHistoryBeforeResponseJson))
    }

    override func tearDown() {
        sut = nil
        nullSut = nil
        super.tearDown()
    }
    
    private func convertToDict(_ json: String) -> [String: Any?] {
        return try! JSONSerialization.jsonObject(with: json.data(using: .utf8)!, options: []) as! [String : Any?]
    }
    
    // MARK: - Tests

    func testInitRawData() {
        XCTAssertNotNil(sut.getData())
    }

    func testInitRawDataNullValue() {
        XCTAssertNil(nullSut.getData())
    }

    func testInitHistoryResponseDataHasMore() {
        let expectedIsHasMore = true

        XCTAssertEqual(sut.getData()?.isHasMore(), expectedIsHasMore)
    }

    func testInitHistoryResponseDataHasMoreNullValue() {
        let expectedIsHasMore = false

        let sut = HistoryBeforeResponse(jsonDictionary: convertToDict(nullHistoryBeforeResponseDataJson))

        XCTAssertEqual(sut.getData()?.isHasMore(), expectedIsHasMore)
    }

    func testInitHistoryResponseDataMessages() {
        let expectedMessageCount = 2

        XCTAssertEqual(sut.getData()?.getMessages()?.count, expectedMessageCount)
    }

    func testInitHistoryBeforeResponseDataMessagesNullValue() {
        let expectedMessagesIsEmpty = true

        let sut = HistoryBeforeResponse(jsonDictionary: convertToDict(nullHistoryBeforeResponseDataJson))

        XCTAssertEqual(sut.getData()?.getMessages()?.isEmpty, expectedMessagesIsEmpty)
    }
}
