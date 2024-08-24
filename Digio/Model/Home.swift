//
//  Home.swift
//  Digio
//
//  Created by Guilherme Duarte on 21/08/24.
//

import Foundation

public class Home {
    public var spotlight: [Spotlight]
    public var products: [Products]
    public var cash: Cash

    public init(
        spotlight: [Spotlight],
        products: [Products],
        cash: Cash
    ) {
        self.spotlight = spotlight
        self.products = products
        self.cash = cash
    }
}
