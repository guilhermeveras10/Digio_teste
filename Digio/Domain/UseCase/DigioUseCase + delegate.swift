//
//  DigioUseCase + Delegate.swift
//  Digio
//
//  Created by Guilherme Duarte on 21/08/24.
//


import Foundation

extension DigioUseCase: DigioServiceProtocol {
    public func failCall(httpResponseCode: Int) {
        DigioManager.delegate?.errorGenerate(error: .errorRequest(code: httpResponseCode))
    }
    
    public func successCall(response: ProductResponse) {
        homeResponse = response
        createResponse()
    }
    
}
