//
//  NSObject+LifeCycle.swift
//  Transitions
//
//  Created by Max Ovtsin on 5/6/19.
//  Copyright © 2019 Max Ovtsin. All rights reserved.
//

import Foundation

extension NSObject {

    // MARK: - Inner type
    private struct AssociatedKeys {
        static var AssociatedKeyName = "on_deinit_associated_key"
    }

    private final class Deallocator {

        var closure: () -> Void

        init(_ closure: @escaping () -> Void) {
            self.closure = closure
        }

        deinit {
            closure()
        }
    }

    var onDeinit: () -> Void {
        set {
            let deallocator = Deallocator(newValue)
            objc_setAssociatedObject(
                self,
                &AssociatedKeys.AssociatedKeyName,
                deallocator,
                .OBJC_ASSOCIATION_RETAIN
            )
        }
        get { return {} }
    }
}
