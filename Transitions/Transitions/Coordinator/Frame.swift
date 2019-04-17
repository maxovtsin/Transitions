//
//  Frame.swift
//  Transitions
//
//  Created by Max Ovtsin on 7/4/19.
//  Copyright © 2019 Max Ovtsin. All rights reserved.
//

import UIKit

public enum PresentationMode {
    case modal
    case push
    case viewless
    case root
    case custom
}

public class Frame {

    let flow: AnyObject
    let presentationMode: PresentationMode
    weak var viewController: UIViewController?
    
    public init<FlowT>(
        flow: FlowT,
        presentationMode: PresentationMode
        ) where FlowT: Flow {
        self.flow = flow
        self.presentationMode = presentationMode
        self.viewController = nil
    }
    
    public init<FlowT>(
        flow: FlowT,
        viewController: UIViewController,
        presentationMode: PresentationMode
        ) where FlowT: Flow {
        self.flow = flow
        self.presentationMode = presentationMode
        self.viewController = viewController
    }
}

extension Frame: CustomStringConvertible {

    public var description: String {
        return String(describing: flow)
    }
}
