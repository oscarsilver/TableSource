//
//  AppDelegate.swift
//  TableSourceTest
//
//  Created by Oscar Silver on 2017-08-02.
//  Copyright © 2017 Oscar Silver. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        showGUI()
        return true
    }
}

// MARK: Private Methods
private extension AppDelegate {
    func showGUI() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        let viewController = ViewController()
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
