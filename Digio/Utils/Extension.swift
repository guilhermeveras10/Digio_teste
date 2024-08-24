//
//  Extension.swift
//  Digio
//
//  Created by Guilherme Duarte on 22/08/24.
//

import UIKit

fileprivate var testIdentifierKey: UInt = 0
public extension UIView {
    
    func bindConstraintsToPriorities(constraints: [NSLayoutConstraint: UILayoutPriority?]) -> [NSLayoutConstraint] {
        constraints.map { (element, priority) -> NSLayoutConstraint in
            guard let priority = priority else { return element }
            element.priority = priority
            return element
        }
    }
    
    func addFullScreenConstraint(respectSafeArea: Bool = false) {
        guard let superView = self.superview else { return }
        let topObject = respectSafeArea ? superView.safeAreaLayoutGuide.topAnchor : superView.topAnchor
        topAnchor.constraint(equalTo: topObject).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
}

extension Array {
    func get(index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

