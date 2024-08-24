//
//  Numbers.swift
//  Digio
//
//  Created by Guilherme Duarte on 21/08/24.
//

import Foundation

struct Numbers {
    struct Infrastructure {
        static let timeoutRequest = 60.0
        static let maxConnectionsPerHost = 10
    }

    struct HttpResponseCode {
        static let success = 200
        static let maxConnectionsPerHost = 10
    }

    struct Service {
        static let secondsInOneHour: TimeInterval = 3600
        static let randomValueAmount = 0.0
    }
}
