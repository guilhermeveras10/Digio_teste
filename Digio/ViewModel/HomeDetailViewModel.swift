//
//  HomeDetailViewModel.swift
//  Digio
//
//  Created by Guilherme Duarte on 23/08/24.
//

import Foundation
import UIKit

class HomeDetailViewModel {
    private let name: String

    private let BannerURL: String

    private let description: String

    init(
        name: String,
        BannerURL: String,
        description: String
    ) {
        self.name = name
        self.BannerURL = BannerURL
        self.description = description
    }

    var title: String {
        name
    }

    var urlString: String {
        BannerURL
    }

    var desc: String {
        description
    }
}
