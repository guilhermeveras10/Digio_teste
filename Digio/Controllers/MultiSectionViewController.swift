//
//  MultiSectionViewController.swift
//  Digio
//
//  Created by Guilherme Duarte on 21/08/24.
//
import SCLAlertView
import UIKit

class MultiSectionViewController: UIViewController {
    lazy var viewModel = HomeViewModel()

    let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()

    lazy var homeView: HomeView = {
        let element = HomeView()
        element.delegate = self
        return element
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        addComponents()
        addComponentsConstraints()

        activityIndicator.startAnimating()
        viewModel.load()
        viewModel.cashInfosLoaded = cashInfosLoaded
        viewModel.errorLoaded = errorLoaded
    }

    // MARK: - Layout Functions

    private func addComponents() {
        view.addSubview(activityIndicator)
        view.addSubview(homeView)
    }

    private func addComponentsConstraints() {
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        homeView.addFullScreenConstraint()
    }

    // MARK: - Helpers

    func cashInfosLoaded() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.homeView.displayScreenValues(self.viewModel)
        }
    }

    func errorLoaded() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            SCLAlertView().showError(
                "\(self.viewModel.errorStatus)",
                subTitle: self.viewModel.errorMessage
            )
        }
    }

    private func goToDetail(_ viewModel: HomeDetailViewModel) {
        let nextController = DetailViewController()
        nextController.configure(viewModel)
        navigationController?.pushViewController(
            nextController,
            animated: true
        )
    }
}

// MARK: - HomeViewDelegate

extension MultiSectionViewController: HomeViewDelegate {
    func didTapImage() {
        guard
            let title = viewModel.cash.title,
            let description = viewModel.cash.description else { return }
        SCLAlertView().showInfo(
            title,
            subTitle: description
        )
    }

    func didTapImageCollection(_ data: Spotlight) {
        guard
            let name = data.name,
            let bannerUrl = data.bannerURL,
            let description = data.description else { return }
        let viewModel = HomeDetailViewModel(
            name: name,
            BannerURL: bannerUrl,
            description: description
        )
        goToDetail(viewModel)
    }

    func didTapImageCollectionProduct(_ data: Products) {
        guard
            let name = data.name,
            let bannerUrl = data.imageURL,
            let description = data.description else { return }
        let viewModel = HomeDetailViewModel(
            name: name,
            BannerURL: bannerUrl,
            description: description
        )
        goToDetail(viewModel)
    }
}
