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
    public weak var viewController: UIViewController?
    
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

public extension Frame {

    func visibleViewController() -> UIViewController? {
        guard let frameViewController = viewController else { return nil }
        switch frameViewController {
        case is UITabBarController:
            return (frameViewController as! UITabBarController).selectedViewController
        default:
            return frameViewController
        }
    }
}

extension Frame: CustomStringConvertible {

    public var description: String {
        return String(describing: flow)
    }
}
