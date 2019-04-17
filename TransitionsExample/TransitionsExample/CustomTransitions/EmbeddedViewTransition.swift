//
//  EmbeddedViewTransition.swift
//  TransitionsExample
//
//  Created by Max Ovtsin on 15/4/19.
//  Copyright © 2019 Max Ovtsin. All rights reserved.
//

import UIKit
import Transitions

extension BaseTransition {
    
    static var embedded: EmbeddedViewTransition {
        return EmbeddedViewTransition()
    }
}

public final class EmbeddedViewTransition: BaseTransition, Transition {

    public func handle<FlowT>(
        flow: FlowT,
        params: (UIView, UIViewController),
        coordinator: MainCoordinator
        ) where FlowT: Flow {

        let contentView = params.0
        let childViewController = params.1

        contentView.addSubview(childViewController.view)
        childViewController.view.translatesAutoresizingMaskIntoConstraints = false

        childViewController.view.topAnchor
            .constraint(equalTo: contentView.topAnchor).isActive = true
        childViewController.view.rightAnchor
            .constraint(equalTo: contentView.rightAnchor).isActive = true
        childViewController.view.bottomAnchor
            .constraint(equalTo: contentView.bottomAnchor).isActive = true
        childViewController.view.leftAnchor
            .constraint(equalTo: contentView.leftAnchor).isActive = true

        coordinator.append(
            frame: Frame(
                flow: flow,
                viewController: params.1,
                presentationMode: .custom
            )
        )
    }
}
