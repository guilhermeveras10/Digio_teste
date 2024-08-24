//
//  DigioManager.swift
//  Digio
//
//  Created by Guilherme Duarte on 21/08/24.
//

import Foundation

public protocol DigioManagerProtocol: class {
    func finishGenerate(data: Home)
    func errorGenerate(error: CodeResponse)
}

public class DigioManager {
    
    public static weak var delegate: DigioManagerProtocol?
    
    public class func create() {
        let service = DigioUseCase()
        service.createDigio()
    }
    
}
