//
//  Flow.swift
//  Transitions
//
//  Created by Max Ovtsin on 27/3/19.
//  Copyright © 2019 Max Ovtsin. All rights reserved.
//

public protocol Flow: class {

    associatedtype Injection
    associatedtype FlowInput

    init()

    func start(
        injection: Injection,
        coordinator: Coordinator,
        transitionHandler: TransitionHandler
    ) -> FlowInput
}

public protocol FlowInput: class { }
