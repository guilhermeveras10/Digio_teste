//
//  DigioManagerTests.swift
//  DigioTests
//
//  Created by Guilherme Duarte on 23/08/24.
//

import XCTest
import Digio

class DigioManagerTests: XCTestCase, DigioManagerProtocol {
    var expectation: XCTestExpectation?
    
    override func setUp() {
        super.setUp()
        DigioManager.delegate = self
    }
    
    func testCreateLib() throws {
        DigioManager.create()
    }

    func finishGenerate(data: Home) {
        XCTAssertNotNil(data)
        expectation?.fulfill()
        expectation = nil
    }
    
    func errorGenerate(error: CodeResponse) {
        XCTAssertNotNil(error.value)
        expectation?.fulfill()
        expectation = nil
    }

}

