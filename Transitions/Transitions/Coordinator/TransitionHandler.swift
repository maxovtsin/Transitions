//
//  TransitionHandler.swift
//  Transitions
//
//  Created by Max Ovtsin on 27/3/19.
//  Copyright © 2019 Max Ovtsin. All rights reserved.
//

public protocol TransitionHandler {

    func present<TransitionT, ParametersT, FlowT>(
        flow: FlowT,
        transition: TransitionT,
        params: ParametersT
        ) where FlowT: Flow,
        TransitionT: Transition,
        TransitionT: BaseTransition,
        ParametersT == TransitionT.ParametersT
}
