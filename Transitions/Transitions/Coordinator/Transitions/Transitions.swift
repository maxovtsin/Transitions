//
//  Transitions.swift
//  Transitions
//
//  Created by Max Ovtsin on 15/4/19.
//  Copyright © 2019 Max Ovtsin. All rights reserved.
//

public protocol Transition {

    associatedtype ParametersT

    func handle<FlowT>(
        flow: FlowT,
        params: ParametersT,
        coordinator: MainCoordinator
        ) where FlowT: Flow
}

open class BaseTransition {

    public static let push = PushTransition()
    public static let modal = ModalTransition()
    public static let root = RootTransition()
    public static let inTabBar = InTabBarTransition()

    public init() {}
}
