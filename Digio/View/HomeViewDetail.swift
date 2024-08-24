//
//  HomeDetail.swift
//  Digio
//
//  Created by Guilherme Duarte on 21/08/24.
//

import SDWebImage
import UIKit

protocol HomeViewDetailDelegate: AnyObject {
    func tappedImage(
        _ title: String,
        _ descriptionTwo: String
    )
}

class HomeViewDetail: UIView {
    private var title = ""

    private var descriptionTwo = ""

    // MARK: - Delegate

    weak var delegate: HomeViewDetailDelegate?

    // MARK: - UI Elements

    private lazy var stackViewConstraints = Layout.Constraint(
        topAnchor: 80,
        leadingAnchor: 11
    )

    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            banner,
            name,
            desc,
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 15
        return stackView
    }()

    lazy var banner: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.layer.cornerRadius = 10
        img.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(bannerTapped)
        )
        img.addGestureRecognizer(tapGesture)
        return img
    }()

    lazy var name: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    lazy var desc: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.numberOfLines = 10
        return element
    }()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    // MARK: - private funcs

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        addComponents()
        addConstraints()
    }

    private func addComponents() {
        addSubview(stackView)
    }

    private func addConstraints() {
        addStackViewConstraints()
    }

    private func addStackViewConstraints() {
        stackView.topAnchor.constraint(
            equalTo: topAnchor,
            constant: stackViewConstraints.topAnchor
        ).isActive = true
        stackView.leadingAnchor.constraint(
            equalTo: leadingAnchor,
            constant: stackViewConstraints.leadingAnchor
        ).isActive = true
        stackView.trailingAnchor.constraint(
            equalTo: trailingAnchor,
            constant: stackViewConstraints.trailingAnchor
        ).isActive = true
    }

    // MARK: - Logic display

    func displayScreenValues(_ viewModel: HomeDetailViewModel) {
        descriptionTwo = viewModel.desc
        title = viewModel.title
        name.text = viewModel.title
        banner.sd_setImage(
            with: URL(string: viewModel.urlString),
            placeholderImage: UIImage(resource: .gtDWTpeapa147Sg77ENYZz3HFESKnOwa1HlrzHXU)
        )
        desc.text = viewModel.desc
    }

    @objc func bannerTapped() {
        delegate?.tappedImage(
            title,
            descriptionTwo
        )
    }
}
