//
//  Layout.swift
//  Digio
//
//  Created by Guilherme Duarte on 22/08/24.
//

import UIKit

public enum Layout {
    public struct Constraint {
        public var topAnchor: CGFloat
        public var leadingAnchor: CGFloat
        public var trailingAnchor: CGFloat
        public var bottomAnchor: CGFloat
        public var centerXAnchor: CGFloat
        public var centerYAnchor: CGFloat
        public var width: CGFloat
        public var height: CGFloat
        
        public init(
            topAnchor: CGFloat = 0.0,
            leadingAnchor: CGFloat = 0.0,
            trailingAnchor: CGFloat = 0.0,
            bottomAnchor: CGFloat = 0.0,
            centerXAnchor: CGFloat = 0.0,
            centerYAnchor: CGFloat = 0.0,
            width: CGFloat = 0.0,
            height: CGFloat = 0.0
            ) {
            self.topAnchor = topAnchor
            self.leadingAnchor = leadingAnchor
            self.trailingAnchor = trailingAnchor
            self.bottomAnchor = bottomAnchor
            self.centerXAnchor = centerXAnchor
            self.centerYAnchor = centerYAnchor
            self.width = width
            self.height = height
        }
    }
}
