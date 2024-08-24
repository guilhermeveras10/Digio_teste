//
//  HomeViewMdel.swift
//  Digio
//
//  Created by Guilherme Duarte on 21/08/24.
//

import Foundation
import UIKit

class HomeViewModel: DigioManagerProtocol {
    var spotlight: [Spotlight] = [] {
        didSet {
            cashInfosLoaded?()
        }
    }

    var products: [Products] = [] {
        didSet {
            cashInfosLoaded?()
        }
    }

    var cash: Cash = Cash() {
        didSet {
            cashInfosLoaded?()
        }
    }

    var errorStatus: Int = 0 {
        didSet {
            errorLoaded?()
        }
    }

    var cashInfosLoaded: (() -> Void)?

    var errorLoaded: (() -> Void)?

    var imageName: UIImage {
        .gtDWTpeapa147Sg77ENYZz3HFESKnOwa1HlrzHXU
    }
    
    var errorMessage: String {
        Strings.View.errorMessage
    }
    
    var name: String {
        Strings.View.name
    }

    var titleSecond: String {
        Strings.View.secondTitle
    }

    func load() {
        DigioManager.create()
        DigioManager.delegate = self
    }

    func finishGenerate(data: Home) {
        spotlight = data.spotlight
        products = data.products
        cash = data.cash
    }

    func errorGenerate(error: CodeResponse) {
        errorStatus = error.value
    }
}
