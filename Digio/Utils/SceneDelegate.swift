//
//  SceneDelegate.swift
//  Digio
//
//  Created by Guilherme Duarte on 21/08/24.
//
import UIKit

@available(
    iOS 13.0,
    *
)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let navigationController = UINavigationController(rootViewController: MultiSectionViewController())
            window.rootViewController = navigationController
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
