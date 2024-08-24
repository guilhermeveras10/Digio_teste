//
//  Spotlight.swift
//  Digio
//
//  Created by Guilherme Duarte on 21/08/24.
//

import Foundation

public class ProductResponse: Codable {
    public var spotlight: [Spotlight]?
    public var products: [Products]?
    public var cash: Cash?
}

public class Spotlight: Codable {
    public var name: String?
    public var bannerURL: String?
    public var description: String?
}

public class Products: Codable {
    public var name: String?
    public var imageURL: String?
    public var description: String?
}

public class Cash: Codable {
    public var title: String?
    public var bannerURL: String?
    public var description: String?
}
