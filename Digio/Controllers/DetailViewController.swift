//
//  DetailViewController.swift
//  Digio
//
//  Created by Guilherme Duarte on 23/08/24.
//

import SCLAlertView
import UIKit

class DetailViewController: UIViewController {
    lazy var homeDetailView: HomeViewDetail = {
        let element = HomeViewDetail()
        element.delegate = self
        return element
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addComponents()
        addComponentsConstraints()
    }

    // MARK: - Layout Functions

    private func addComponents() {
        view.addSubview(homeDetailView)
    }

    private func addComponentsConstraints() {
        homeDetailView.addFullScreenConstraint()
    }

    func configure(_ viewModel: HomeDetailViewModel) {
        homeDetailView.displayScreenValues(viewModel)
    }
}

extension DetailViewController: HomeViewDetailDelegate {
    func tappedImage(
        _ title: String,
        _ descriptionTwo: String
    ) {
        SCLAlertView().showInfo(
            title,
            subTitle: descriptionTwo
        )
    }
}
