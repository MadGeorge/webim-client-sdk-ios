//
//  HistoryIDTests.swift
//  WebimClientLibrary
//
//  Created by Nikita Lazarev-Zubov on 01.02.18.
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
import XCTest
@testable import WebimMobileSDK

class HistoryIDTests: XCTestCase {

    var firstSut: HistoryID?
    var secondSut: HistoryID?

    let firstDataBaseId = "db_id1"
    let secondDataBaseId = "db_id2"

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        firstSut = nil
        secondSut = nil
        super.tearDown()
    }
    
    // MARK: - Tests

    func testEqualOperationDifferentId() {
        firstSut = HistoryID(dbID: firstDataBaseId, timeInMicrosecond: 1)
        secondSut = HistoryID(dbID: secondDataBaseId, timeInMicrosecond: 2)

        XCTAssertFalse(firstSut == secondSut)
    }

    func testEqualOperationSameId() {
        firstSut = HistoryID(dbID: firstDataBaseId, timeInMicrosecond: 1)
        secondSut = HistoryID(dbID: firstDataBaseId, timeInMicrosecond: 1)

        XCTAssertTrue(firstSut == secondSut)
    }

    func testEqualOperationWithNil() {
        firstSut = HistoryID(dbID: firstDataBaseId, timeInMicrosecond: 1)
        secondSut = nil

        XCTAssertFalse(firstSut == secondSut)
    }

    func testEqualOperationBothNil() {
        firstSut = nil
        secondSut = nil

        XCTAssertTrue(firstSut == secondSut)
    }
}
