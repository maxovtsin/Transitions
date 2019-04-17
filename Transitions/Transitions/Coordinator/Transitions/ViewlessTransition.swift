//
//  ViewlessTransition.swift
//  Transitions
//
//  Created by Max Ovtsin on 15/4/19.
//  Copyright © 2019 Max Ovtsin. All rights reserved.
//

public final class ViewlessTransition: BaseTransition, Transition {

    public func handle<FlowT>(
        flow: FlowT,
        params: Void,
        coordinator: MainCoordinator
        ) where FlowT: Flow {

        coordinator.append(
            frame: Frame(
                flow: flow,
                presentationMode: .viewless
            )
        )
    }
}
