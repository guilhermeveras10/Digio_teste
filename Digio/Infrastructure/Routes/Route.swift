//
//  Route.swift
//  Digio
//
//  Created by Guilherme Duarte on 21/08/24.
//

import Foundation

public enum Routes {
    case products
}

public extension Routes {
    var value: String {
        switch self {
        case .products:
            return Strings.Routes.products
        }
    }
}
