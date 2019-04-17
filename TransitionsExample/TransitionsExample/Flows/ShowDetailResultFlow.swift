//
//  ShowDetailResultFlow.swift
//  TransitionsExample
//
//  Created by Max Ovtsin on 15/4/19.
//  Copyright © 2019 Max Ovtsin. All rights reserved.
//

import UIKit
import Transitions

final class ShowDetailResultFlow: Flow {

    private let resultVC = ResultViewController()

    func start(
        injection: UIView,
        coordinator: Coordinator,
        transitionHandler: TransitionHandler
        ) -> ShowDetailResultFlowInput {

        transitionHandler.present(
            flow: self,
            transition: BaseTransition.embedded,
            params: (injection, resultVC)
        )
        return self
    }
}

extension ShowDetailResultFlow: ShowDetailResultFlowInput {

    func updated() {
        resultVC.labelDetail.text = "Data is Updated"
    }

    func parentFlowIsDead(_ coordinator: Coordinator) {
        coordinator.didFinish(flow: self)
    }
}

protocol ShowDetailResultFlowInput: FlowInput {
    func updated()
    func parentFlowIsDead(_ coordinator: Coordinator)
}
