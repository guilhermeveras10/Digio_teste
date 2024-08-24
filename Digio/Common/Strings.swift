//
//  Strings.swift
//  Digio
//
//  Created by Guilherme Duarte on 21/08/24.
//

import Foundation

public struct Strings {

    struct Infrastructure {
        static let baseUrl = "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com"
    }
    
    struct Routes {
        static let products = "/sandbox/products"
    }
    
    struct View {
        static let load = "Carregando..."
        static let name = "Ola, Maria"
        static let secondTitle = "Produtos"
        static let errorMessage = "Tente novamente mais tarde"
    }
}
