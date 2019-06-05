//
//  PushTransition.swift
//  Transitions
//
//  Created by Max Ovtsin on 15/4/19.
//  Copyright © 2019 Max Ovtsin. All rights reserved.
//

import UIKit

public final class PushTransition: BaseTransition, Transition {

    public func handle<FlowT>(
        flow: FlowT,
        params: UIViewController,
        coordinator: MainCoordinator
        ) where FlowT: Flow {

        let frame = coordinator.lastVisibleFrame()
        let viewController = frame.visibleViewController()

        if frame.presentationMode == .push {
            viewController?.navigationController?.pushViewController(
                params,
                animated: true
            )
        } else if let navigationController = viewController as? UINavigationController {
            navigationController.pushViewController(
                params,
                animated: true
            )
        } else {
            fatalError("Can't")
        }

        coordinator.injectOnDeinitHandler(
            object: params,
            flow: flow
        )
        
        coordinator.append(
            frame: Frame(
                flow: flow,
                viewController: params,
                presentationMode: .push
            )
        )
    }
}
