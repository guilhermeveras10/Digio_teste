//
//  ProductCell.swift
//  Digio
//
//  Created by Guilherme Duarte on 21/08/24.
//

import UIKit
import SDWebImage

class ProductCell: UICollectionViewCell {

    static var id: String {
        get {
            return String(describing: self)
        }
    }

    private lazy var imageContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        return view
    }()

    lazy var image: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.contentMode = .scaleAspectFit
        icon.clipsToBounds = true
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
        addSubview(imageContainer)
        imageContainer.addSubview(image)
    }

    private func addConstraints() {
        addImageContainerConstraints()
        addImageConstraints()
    }

    private func addImageContainerConstraints() {
        imageContainer.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        imageContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        imageContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        imageContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }

    private func addImageConstraints() {
        image.widthAnchor.constraint(equalToConstant: 100).isActive = true
        image.heightAnchor.constraint(equalToConstant: 100).isActive = true
        image.centerXAnchor.constraint(equalTo: imageContainer.centerXAnchor).isActive = true
        image.centerYAnchor.constraint(equalTo: imageContainer.centerYAnchor).isActive = true
    }

    func configure(with imageURL: String) {
        image.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage(resource: .gtDWTpeapa147Sg77ENYZz3HFESKnOwa1HlrzHXU))
    }
}
