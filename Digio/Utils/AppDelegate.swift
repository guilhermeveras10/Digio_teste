//
//  AppDelegate.swift
//  Digio
//
//  Created by Guilherme Duarte on 21/08/24.
//
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    )
        -> Bool {
        if
            #available(
                iOS 13,
                *
            ) {
            // Handle iOS 13 and later versions
            // For example, setup scene delegate if needed
        } else {
            window = UIWindow()
            if let window = window {
                let navigationController = UINavigationController(rootViewController: MultiSectionViewController())
                window.rootViewController = navigationController
                self.window = window
                window.makeKeyAndVisible()
            }
        }
        return true
    }
}
