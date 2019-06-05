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
    let coordinator: Coordinator

    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }

    func start(
        injection: UIView,
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
}

protocol ShowDetailResultFlowInput: FlowInput {
    func updated()
}
