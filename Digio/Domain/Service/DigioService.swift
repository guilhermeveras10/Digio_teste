//
//  DigioService.swift
//  Digio
//
//  Created by Guilherme Duarte on 21/08/24.
//

import Foundation

public protocol DigioServiceProtocol: class {
    func successCall(response: ProductResponse)
    func failCall(httpResponseCode: Int)
}

public class DigioService {
    
    public var delegate: DigioServiceProtocol?
    
    public init(){}
    
    public func callDigio() {
        ServiceConfig.requestGetAPI(route: .products) { (data) in
            guard let data = data else {
                self.delegate?.failCall(httpResponseCode: 204)
                return
            }
            do {
                let response = try JSONDecoder().decode(ProductResponse.self, from: data)
                self.delegate?.successCall(response: response)
            } catch {
                self.delegate?.failCall(httpResponseCode: 500)
            }
            return
        } onError: { ( error ) in
            self.delegate?.failCall(httpResponseCode: error.value)
        }
    }
}
