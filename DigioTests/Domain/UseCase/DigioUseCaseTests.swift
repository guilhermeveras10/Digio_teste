//
//  DigioUseCaseTests.swift
//  DigioTests
//
//  Created by Guilherme Duarte on 23/08/24.
//

import XCTest
import Digio

class DigioUseCaseTests: XCTestCase, DigioManagerProtocol {
    
    let useCase = DigioUseCase()
    
    var expectation: XCTestExpectation?
    
    override func setUp() {
        super.setUp()
        
        DigioManager.delegate = self
    }
    
    func testCall() throws {
        useCase.createDigio()
    }
    
    func testCreateResponse() {
        useCase.createResponse()
    }
    
    func testfailCall() {
        useCase.failCall(httpResponseCode: 401)
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
