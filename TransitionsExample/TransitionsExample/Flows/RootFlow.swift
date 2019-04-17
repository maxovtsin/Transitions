//
//  RootFlow.swift
//  Transitions
//
//  Created by Max Ovtsin on 27/3/19.
//  Copyright © 2019 Max Ovtsin. All rights reserved.
//

import UIKit
import Transitions

final class RootFlow: Flow {

    func start(
        injection: ServiceProvider,
        coordinator: Coordinator,
        transitionHandler: TransitionHandler
        ) {

        let mainViewController = MainViewController()
        let navigationController = UINavigationController(
            rootViewController: mainViewController
        )

        mainViewController.didPressDetails = { [weak self] in
            self?.showDetails(
                coordinator: coordinator,
                injection: injection
            )
        }

        transitionHandler.present(
            flow: self,
            transition: BaseTransition.root,
            params: navigationController
        )
    }

    // MARK: - Private functions
    private func showDetails(
        coordinator: Coordinator,
        injection: ServiceProvider
        ) {

        coordinator.show(
            OpenDetailFlow.self,
            injection: OpenDetailFlow.Injection(
                model: EntityA(name: "A"),
                service: injection.serviceA
            )
        )
    }
}
