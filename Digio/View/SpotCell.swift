//
//  Home.swift
//  Digio
//
//  Created by Guilherme Duarte on 21/08/24.
//

import UIKit
import SDWebImage

class SpotCell: UICollectionViewCell {
    
    static var id: String {
        get {
            return String.init(describing: self)
        }
    }
    
    private lazy var imageConstraints = Layout.Constraint(
        width: 350,
        height: 200
    )
    lazy var image: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.contentMode = .scaleAspectFill
        icon.clipsToBounds = true
        icon.layer.cornerRadius = 10
        return icon
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        addComponents()
        addConstraints()
    }

    private func addComponents() {
        addSubview(image)
    }

    private func addConstraints() {
        image.widthAnchor.constraint(equalToConstant: imageConstraints.width).isActive = true
        image.heightAnchor.constraint(equalToConstant: imageConstraints.height).isActive = true
    }
    
    func configure(with imageURL: String) {
        image.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage(resource: .gtDWTpeapa147Sg77ENYZz3HFESKnOwa1HlrzHXU))
    }
}
