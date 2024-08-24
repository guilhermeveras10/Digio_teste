//
//  DigioServiceTests.swift
//  DigioTests
//
//  Created by Guilherme Duarte on 23/08/24.
//

import XCTest
import Digio

class DigioServiceTests: XCTestCase, DigioServiceProtocol {
    
    var expectation: XCTestExpectation?
    
    var service: DigioService {
        let service = DigioService()
        service.delegate = self
        return service
    }
    
    override func setUp() {
        super.setUp()
    }

    func testCallSuccess() throws {
        service.callDigio()
        expectation = expectation(description: "Request service")
        waitForExpectations(timeout: 20)
    }
    
    func failCall(httpResponseCode: Int) {
        expectation?.fulfill()
        expectation = nil
    }
    
    func successCall(response: ProductResponse) {
        print("Success call")
        XCTAssertEqual(response.cash?.title, "digio Cash")
        expectation?.fulfill()
        expectation = nil
    }
}
