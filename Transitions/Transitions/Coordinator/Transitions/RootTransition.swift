//
//  RootTransition.swift
//  Transitions
//
//  Created by Max Ovtsin on 15/4/19.
//  Copyright © 2019 Max Ovtsin. All rights reserved.
//

import UIKit

public final class RootTransition: BaseTransition, Transition {

    public func handle<FlowT>(
        flow: FlowT,
        params: UIViewController,
        coordinator: MainCoordinator
        ) where FlowT: Flow {

        coordinator.window?.rootViewController = params
        if coordinator.window?.isKeyWindow == false {
            coordinator.window?.makeKeyAndVisible()
        }

        coordinator.cleanStack()

        coordinator.append(
            frame: Frame(
                flow: flow,
                viewController: params,
                presentationMode: .root
            )
        )
    }
}
