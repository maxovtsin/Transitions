//
//  OpenDetailFlow.swift
//  Transitions
//
//  Created by Max Ovtsin on 27/3/19.
//  Copyright © 2019 Max Ovtsin. All rights reserved.
//

import UIKit
import Transitions

final class OpenDetailFlow: Flow {

    private weak var detailResultFlowInput: ShowDetailResultFlowInput?
    let coordinator: Coordinator

    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }

    func start(
        injection: Injection,
        transitionHandler: TransitionHandler
        ) {

        let viewController = DetailViewController(injection: injection)
        let injection = ShowOptionsFlow.Injection(prepared: { [weak self /*, view = viewController.resultContentView */] result in
            self?.detailResultFlowInput = self?.coordinator.show(
                ShowDetailResultFlow.self,
                injection: viewController.resultContentView//view
            )
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                self?.detailResultFlowInput?.updated()
            })
        })
        viewController.didPress = { [weak self] in
            self?.coordinator.show(
                ShowOptionsFlow.self,
                injection: injection
            )
        }
        viewController.didDeinit = { [weak self] in
            guard let self = self else { return }
            self.detailResultFlowInput?.parentFlowIsDead(self.coordinator)
            self.coordinator.didFinish(flow: self)
        }

        transitionHandler.present(
            flow: self,
            transition: BaseTransition.push,
            params: viewController
        )
    }

    struct Injection {
        let model: EntityA
        let service: ServiceA
    }
}
