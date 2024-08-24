//
//  ServiceConfig.swift
//  Digio
//
//  Created by Guilherme Duarte on 21/08/24.
//

import Foundation
import UIKit

enum RequestError {
    case serviceNotFound
    case generic(statusCode: Int)
    case errorRequest(statusCode: Int)
    case notContent
}

extension RequestError {
    var value: Int {
        switch self {
        case .serviceNotFound:
            return 404
        case let .generic(statusCode):
            return statusCode
        case let .errorRequest(statusCode):
            return statusCode
        case .notContent:
            return 204
        }
    }
}

class ServiceConfig {
    private static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = Numbers.Infrastructure.timeoutRequest
        config.httpMaximumConnectionsPerHost = Numbers.Infrastructure.maxConnectionsPerHost
        return config
    }()

    private static let session = URLSession(configuration: configuration)

    class func requestGetAPI(
        route: Routes,
        onComplete: @escaping (Data?) -> Void,
        onError: @escaping (RequestError) -> Void
    ) {
        let completeUrl = Strings.Infrastructure.baseUrl + route.value
        guard let url = URL(string: completeUrl) else {
            onError(.serviceNotFound)
            return
        }

        let urlRequest = URLRequest(url: url)
        let dataTask = session.dataTask(with: urlRequest) { (
            data: Data?,
            response: URLResponse?,
            error: Error?
        ) in

            if error == nil {
                guard let response = response as? HTTPURLResponse else {
                    onError(.notContent)
                    return
                }

                if response.statusCode == Numbers.HttpResponseCode.success {
                    guard let data = data else {
                        onError(.notContent)
                        return
                    }

                    onComplete(data)

                } else {
                    onError(.errorRequest(statusCode: response.statusCode))
                }

            } else {
                onError(.generic(statusCode: 500))
            }
        }
        dataTask.resume()
    }
}
