//
//  InTabBarTransition.swift
//  Transitions
//
//  Created by Max Ovtsin on 5/6/19.
//  Copyright © 2019 Max Ovtsin. All rights reserved.
//

import UIKit

public final class InTabBarTransition: BaseTransition, Transition {

    public func handle<FlowT>(
        flow: FlowT,
        params: (UIViewController, UIImage?),
        coordinator: MainCoordinator
        ) where FlowT: Flow {

        guard let tabBarController = coordinator.recentFrame(of: .root)
            .viewController as? UITabBarController else {
                fatalError("Is not supported")
        }
        var controllers = tabBarController.viewControllers ?? []
        controllers.append(params.0)

        tabBarController.setViewControllers(
            controllers,
            animated: false
        )

        if let image = params.1 {
            let items = tabBarController.tabBar.items!
            let count = controllers.count
            items[count - 1].image = image
        }

        coordinator.append(
            frame: Frame(
                flow: flow,
                viewController: params.0,
                presentationMode: .inTabBar
            )
        )
    }
}
