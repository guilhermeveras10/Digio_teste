//
//  DigioUseCase.swift
//  Digio
//
//  Created by Guilherme Duarte on 21/08/24.
//

import Foundation

public enum CodeResponse {
    case errorRequest(code: Int)
    case errorGenerateResponse

    public var value: Int {
        switch self {
        case let .errorRequest(code):
            return code
        case .errorGenerateResponse:
            return 500
        }
    }
}

public class DigioUseCase {
    var serviceDigio: DigioService {
        let service = DigioService()
        service.delegate = self
        return service
    }

    var homeResponse: ProductResponse?

    public init() {}

    public func createDigio() {
        call()
    }

    func call() {
        serviceDigio.callDigio()
    }

    public func createResponse() {
        let response = Home(
            spotlight: homeResponse?.spotlight ?? [Spotlight()],
            products: homeResponse?.products ?? [Products()],
            cash: homeResponse?.cash ?? Cash()
        )
        DigioManager.delegate?.finishGenerate(data: response)
    }
}
