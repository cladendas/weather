//
//  AppDelegate.swift
//  Weather
//
//  Created by cladendas on 29.06.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    //создаём окно
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        loadInitialFlow()
        
        return true
    }

    private func loadInitialFlow() {
        let navigationController = UINavigationController(rootViewController: SearchViewController())
        
        //получение фрейма для основного окна
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

}

