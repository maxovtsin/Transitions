//
//  AppDelegate.swift
//  Transitions
//
//  Created by Max Ovtsin on 27/3/19.
//  Copyright © 2019 Max Ovtsin. All rights reserved.
//

import UIKit
import Transitions

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    private let coordinator = MainCoordinator()

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        coordinator.launch(
            rootFlowType: RootFlow.self,
            injection: ServiceProvider()
        )

        return true
    }
}
