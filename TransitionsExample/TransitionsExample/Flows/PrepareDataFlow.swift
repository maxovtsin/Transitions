//
//  PrepareDataFlow.swift
//  TransitionsExample
//
//  Created by Max Ovtsin on 7/4/19.
//  Copyright © 2019 Max Ovtsin. All rights reserved.
//

import UIKit
import Transitions

final class PrepareDataFlow: Flow {

    let coordinator: Coordinator

    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    func start(
        injection: Injection,
        transitionHandler: TransitionHandler
        ) {

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            injection.prepared("Some Data")
        }
    }

    struct Injection {
        let prepared: (String) -> Void
    }
}
